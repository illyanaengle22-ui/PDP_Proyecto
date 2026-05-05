extends CharacterBody2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var zombie_vfx: AudioStreamPlayer2D = %ZombieVFX

var hp_maxima= 100
var hp_acutual = 100
var vivo = true

signal zombie_muerto
signal zombie_daño(hp_restante)
signal zombie_ataco

func _ready():
	zombie_vfx.play()
	animated_sprite_2d.play("default")
	print("Zombie cargado con: ", hp_acutual, "Hp")
	
func hit(cantidad: int):
	if not vivo:
		return
	hp_acutual -= cantidad
	print("Zombie recibio", cantidad ,"daño. Hp restante: ",hp_acutual)
	
	emit_signal("zombie_daño", hp_acutual)
	
	animated_sprite_2d.play("hurt")
	await animated_sprite_2d.animation_finished
	
	if hp_acutual <= 0:
		morir()
	else:
		animated_sprite_2d.play("default")
		
func morir():
	vivo = false
	animated_sprite_2d.play("die")
	await animated_sprite_2d.animation_finished
	emit_signal("zombie_muerto")
	queue_free()
func atacar():
	if not vivo:
		return
	animated_sprite_2d.play("atack")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("default")
	
	emit_signal("zombie_ataco")	

		
