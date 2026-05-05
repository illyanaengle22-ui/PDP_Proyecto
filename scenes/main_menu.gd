extends Node

@onready var click: AudioStreamPlayer2D = $Click


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_start_pressed() -> void:
	click.play()
	await click.finished
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
