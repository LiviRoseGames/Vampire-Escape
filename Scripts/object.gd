extends Area2D

var selected : bool
var playerStop : Vector2

signal send_PlayerStop(sig_PlayerStop)

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
		0:
			playerStop = Vector2(global_position.x, global_position.y - stoppingPointOffset)
		1:
			playerStop = Vector2(global_position.x + stoppingPointOffset, global_position.y)
		2:
			playerStop = Vector2(global_position.x, global_position.y + stoppingPointOffset)
		3:
			playerStop = Vector2(global_position.x - stoppingPointOffset, global_position.y)
	
	emit_signal("send_PlayerStop", playerStop)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_area_entered(area):
	animPlayer.play("Glow")
	selected = true

func _on_area_exited(area):
	animPlayer.play("RESET")
	selected = false
