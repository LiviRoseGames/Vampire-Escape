extends Node2D

var resource = load("res://dialogue/painting.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	DialogueManager.show_dialogue_balloon(resource, "painting")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
