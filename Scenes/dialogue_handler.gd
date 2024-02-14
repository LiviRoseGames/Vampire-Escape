extends Node2D

@onready var ezDialogue = $EzDialogue
@onready var state = {}

@export var dialogue_json = {}

# Called when the node enters the scene tree for the first time.
func _ready():
	ezDialogue.start_dialogue(dialogue_json, state)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
