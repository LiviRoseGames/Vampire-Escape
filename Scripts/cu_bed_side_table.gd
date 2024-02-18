extends Node2D

@onready var blackRect = $ColorRect
@onready var codeInput = $codeInput

var resource = load("res://dialogue/bedsidetable.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalManager.hasDesk:
		DialogueManager.show_dialogue_balloon(resource, "diary")
	else:
		DialogueManager.show_dialogue_balloon(resource, "desk")
	setLock(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalManager.examiningLock == true:
		setLock(true)
	if GlobalManager.hasDesk == true and not GlobalManager.deskUnlock:
		DialogueManager.show_dialogue_balloon(resource, "unlock_desk")
	

func setLock(state : bool):
	blackRect.visible = state
	codeInput.visible = state
	
