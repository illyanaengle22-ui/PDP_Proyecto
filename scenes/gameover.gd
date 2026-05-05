extends Node
@onready var lbl_score: Label = %lblScore


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	lbl_score.text = "Score: " +str(Global.score)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_btn_re_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/Game.tscn")
