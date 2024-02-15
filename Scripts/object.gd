extends Area2D

var selected : bool
var playerStop : Vector2

#var stoppingPointDirection : int

@export var sceneTransfer : String
@export_category("stoppingPoint")
@export var stoppingPointOffset : int
@export_enum("North", "East", "South", "West") var stoppingPointDirection: int 

@onready var animPlayer = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
	animPlayer.play("RESET")
	selected = false
	
	match stoppingPointDirection:
		1:
			playerStop = Vector2(global_position.x, global_position.y - stoppingPointOffset)
		2:
			playerStop = Vector2(global_position.x + stoppingPointOffset, global_position.y)
		3:
			playerStop = Vector2(global_position.x, global_position.y + stoppingPointOffset)
		4:
			playerStop = Vector2(global_position.x - stoppingPointOffset, global_position.y)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _input(event):
	if event is InputEventMouseButton && selected:
		GlobalManager.selectedObject.emit(playerStop)
		#get_tree().change_scene_to_file(sceneTransfer)

func _on_mouse_entered():
	animPlayer.play("Glow")
	selected = true

func _on_mouse_exited():
	animPlayer.play("RESET")
	selected = false
