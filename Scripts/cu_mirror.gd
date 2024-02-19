extends Node2D

var resource = load("res://dialogue/mirror.dialogue")

@onready var whole = $Whole
@onready var broke = $Broken

# Called when the node enters the scene tree for the first time.
func _ready():
	setBroken(false)
	if not GlobalManager.hasBook or GlobalManager.hasMirror:
		DialogueManager.show_dialogue_balloon(resource, "mirror")
	else:
		DialogueManager.show_dialogue_balloon(resource, "mirror_post_book")
		


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalManager.hasMirror:
		setBroken(true)

func  setBroken(state : bool):
	broke.visible = state
	whole.visible = !state
