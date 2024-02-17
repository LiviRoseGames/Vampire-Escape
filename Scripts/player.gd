extends Node2D

const SPEED = 200

#@onready var animPlayer = $AnimationPlayer
@onready var nav : NavigationAgent2D = $NavigationAgent2D
var finished = false
var pushedToFinish = false

func _ready() -> void:
	#setting the destination
	nav.target_position = position
	
	#animPlayer.play("Idle")

func _physics_process(delta : float) -> void:
	if not finished:
		var direction = (nav.get_next_path_position() - global_position).normalized()
		translate(direction * SPEED * delta)
	
	#if finished and not pushedToFinish and global_position != nav.get_final_position():
		#translate((nav.get_final_position() - global_position).normalized() * SPEED * delta)
		#pushedToFinish = true
	

func _on_navigation_agent_2d_navigation_finished():
	translate((nav.get_final_position() - global_position).normalized())
	finished = true


func _on_cursor_move_player(sig_MoveCoordinates):
	nav.target_position = sig_MoveCoordinates
	finished = false
	pushedToFinish = false
