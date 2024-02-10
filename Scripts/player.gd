extends CharacterBody2D

const SPEED = 200
var destination := Vector2.ZERO

@onready var animPlayer = $AnimationPlayer

func _ready() -> void:
	destination = position
	animPlayer.play("Idle")

func _process(delta : float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		destination = get_global_mouse_position()
	
	if position != destination:
		animPlayer.play("Walk")
		position = position.move_toward(destination, delta*SPEED)
	
	else:
		animPlayer.play("Idle")
