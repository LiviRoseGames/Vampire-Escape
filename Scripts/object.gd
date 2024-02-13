extends Area2D

var selected : bool

@export var sceneTransfer : String

@onready var animPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("RESET")
	selected = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton && selected:
		get_tree().change_scene_to_file(sceneTransfer)

func _on_mouse_entered():
	animPlayer.play("Glow")
	selected = true

func _on_mouse_exited():
	animPlayer.play("RESET")
	selected = false
