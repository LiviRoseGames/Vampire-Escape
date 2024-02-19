extends Node2D

@onready var blackRect = $ColorRect
@onready var codeInput = $codeInput
@onready var closed = $Closed
@onready var open = $Open

var resource = load("res://dialogue/bedsidetable.dialogue")

# Called when the node enters the scene tree for the first time.
func _ready():
	if GlobalManager.hasBook:
		DialogueManager.show_dialogue_balloon(resource, "book")
	else:
		DialogueManager.show_dialogue_balloon(resource, "bedside_table")
	setLock(false)
	setOpen(false)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if GlobalManager.examiningBSLock == true:
		setLock(true)
	if GlobalManager.hasBook == true and not GlobalManager.bookRead:
		DialogueManager.show_dialogue_balloon(resource, "book")
		setLock(false)
		setOpen(true)
		GlobalManager.bookRead = true
	

func setLock(state : bool):
	blackRect.visible = state
	codeInput.visible = state
	

func  setOpen(state : bool):
	open.visible = state
	closed.visible = !state
