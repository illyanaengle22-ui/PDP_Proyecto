extends CharacterBody2D
@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var shoot_vfx: AudioStreamPlayer2D = %ShootVFX
@onready var die: AudioStreamPlayer2D = $Die


func _ready():
	sprite_2d.play("default")

func disparar():
	sprite_2d.play("disparo")
	shoot_vfx.play()
	await sprite_2d.animation_finished
	sprite_2d.play("default")
