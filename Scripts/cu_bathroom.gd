extends Node2D

var resource1 = load("res://dialogue/bathroom.dialogue")
var resource2 = load("res://dialogue/bathroom2.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	if not GlobalManager.hasBook or GlobalManager.hasBlood:
		DialogueManager.show_dialogue_balloon(resource1, "bathroom")
	else:
		DialogueManager.show_dialogue_balloon(resource2, "bathroom2")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
