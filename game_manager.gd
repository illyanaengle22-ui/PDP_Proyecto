extends Node
@onready var hurt: AudioStreamPlayer2D = $"../hurt"
@onready var bite: AudioStreamPlayer2D = $"../bite"
@onready var die: AudioStreamPlayer2D = $"../Die"
@onready var click: AudioStreamPlayer2D = $"../Click"
@onready var panel: Panel = $"../UI/Panel"
@onready var personaje: CharacterBody2D = %CharacterBody2D
@onready var zombie: CharacterBody2D = %Zombie
@onready var label_patron: Label = %LabelPatron
@onready var label_pregunta: Label = %LabelPregunta
@onready var botones=[
	%BtnOpcion1,
	%BtnOpcion2,
	%BtnOpcion3	
]
@onready var vida_jugador: ProgressBar = %vida_jugador
@onready var vida_zombie: ProgressBar = %vida_zombie
@onready var temporizador: ProgressBar = $"../UI/Panel/VBoxContainer/Temporizador"
var tiempo_pregunta = 10.0
var tiempo_actual = 5.0
var tiempo_activado=false

const BANCO = preload("res://preguntas.gd")
var preguntas_mezcladas=[]
var indice_actual = 0
var pregunta_activa = {}
var responder = true

var hp_jugador = 100
var hp_zombie = 100
var daño_correcto=5
var daño_incorrecto = 10


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("Escena cargada")
	
	if personaje == null:
		print("Error no se encuentra personaje")
	else:
		print("Personaje cargado")
	
	preguntas_mezcladas = BANCO.BANCO.duplicate()
	preguntas_mezcladas.shuffle()
	
	zombie.zombie_muerto.connect(_on_zombie_muerto)
	zombie.zombie_daño.connect(_on_zombie_daño)
	zombie.zombie_ataco.connect(_on_zombie_ataco)
	
	for i in range (botones.size()):
		botones[i].pressed.connect(_on_boton_presionado.bind(i))
	
	mostrar_pregunta()
	vida_jugador.value = hp_jugador
	vida_zombie.value = hp_zombie
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func mostrar_pregunta():
	if indice_actual >= preguntas_mezcladas.size():
		preguntas_mezcladas.shuffle()
		indice_actual=0
		
	pregunta_activa = preguntas_mezcladas[indice_actual]
	indice_actual += 1
	
	label_patron.text ="PATRON: "+pregunta_activa["Patron"]
	label_pregunta.text=pregunta_activa["texto"]
	
	var opciones_mezcladas = pregunta_activa["opciones"].duplicate()
	var texto_correcto = pregunta_activa["opciones"][pregunta_activa["correcta"]]
	opciones_mezcladas.shuffle()
	
	var letras = ["A", "B", "C"]
	for i in range (botones.size()):
		botones[i].text = letras[i] + ") " + opciones_mezcladas[i]
		botones[i].disabled = false
		
		if opciones_mezcladas[i] == texto_correcto:
			botones[i].set_meta("es_correcta",true)
		else:
			botones[i].set_meta("es_correcta",false)
	responder = true	
	tiempo_actual = tiempo_pregunta
	temporizador.value = 100
	tiempo_activado = true
	print("Pregunta mostrada: ", pregunta_activa["texto"])
	
			
func _input(event):
	if not responder:
		return
		
	if event.is_action_pressed("A"):
		botones[0].emit_signal("pressed")
		
	elif event.is_action_pressed("B"):
		botones[1].emit_signal("pressed")
		
	elif event.is_action_pressed("C"):
		botones[2].emit_signal("pressed")
func _on_boton_presionado(indice: int):
	if not responder:
		return
	responder= false
	for btn in botones:
		btn.disabled=true
	var es_correcta = botones[indice].get_meta("es_correcta")
	if es_correcta:
		await respuesta_correcta()
	else:
		await  respuesta_incorrecta()

func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_A) and responder:
		await respuesta_correcta()
	if tiempo_activado and responder:
		tiempo_actual-=delta
		temporizador.value = (tiempo_actual/tiempo_pregunta)*100
		
		if tiempo_actual <=0:
			tiempo_activado = false
			responder = false
			await respuesta_incorrecta()
		
		
func respuesta_correcta():
	print("correcta")
	await personaje.disparar()
	Global.score += 10
	if is_instance_valid(zombie):
		zombie.hit(daño_correcto)
	
	await get_tree().create_timer(0.8).timeout
	
	if is_instance_valid(zombie):
		mostrar_pregunta()

func respuesta_incorrecta():
	print("incorrecta")
	
	if is_instance_valid(zombie):
		await zombie.atacar()
	hurt.play()
	hp_jugador-=daño_incorrecto
	vida_jugador.value = hp_jugador
	print("hp jugador: ",hp_jugador)
	
	if hp_jugador <=0:
		die.play()
		await die.finished
		game_over()
		return
	await get_tree().create_timer(0.8).timeout
	mostrar_pregunta()
func game_over():
	print("Game over")
	get_tree().change_scene_to_file("res://scenes/Gameover.tscn")

func _on_zombie_muerto() -> void:
	print("Zombie muerto, ganaste!")
	vida_zombie.hide()
	
	die.play()
	await die.finished
	
	get_tree().change_scene_to_file("res://scenes/Gameover.tscn")

func _on_zombie_daño(hp_restante: Variant) -> void:
	if not is_instance_valid(zombie):
		return
		
	vida_zombie.value = hp_restante
	print("Zombie Hp restante: ",hp_restante)
func _on_zombie_ataco() -> void:
	bite.play()
	print("zombie ataco al jugador")
