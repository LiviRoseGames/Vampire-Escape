extends Node2D

const SPEED = 200

#@onready var animPlayer = $AnimationPlayer
@onready var nav : NavigationAgent2D = $NavigationAgent2D
var finished = false

func _ready() -> void:
	#setting the destination
	nav.target_position = position
	
	#animPlayer.play("Idle")

func _physics_process(delta : float) -> void:
	if not finished:
		var direction = (nav.get_next_path_position() - global_position).normalized()
		translate(direction * SPEED * delta)
	

func _input(event):
	if event is InputEventMouseButton:
		finished = false
		nav.target_position = get_global_mouse_position()


func _on_navigation_agent_2d_navigation_finished():
	finished = true

