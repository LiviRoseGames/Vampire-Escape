extends Area2D

var selected : bool = false

@onready var animPlayer = $AnimationPlayer

@export var TransitionScene : String 

func _ready():
	animPlayer.speed_scale = 3
	GlobalManager.inRoom = false

func _input(event):
	if event is InputEventMouseButton and selected:
		get_tree().change_scene_to_file("res://Scenes/Objects/CUs/cu_" + TransitionScene + ".tscn")

func _on_mouse_entered():
	animPlayer.play("Glow")
	selected = true

func _on_mouse_exited():
	animPlayer.play_backwards("Glow")
	selected = false
