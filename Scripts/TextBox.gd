extends Node2D

@onready var textLabel = $VBoxContainer/Text
@onready var vBox = $VBoxContainer
@onready var choice_button_tscn = preload("res://Scenes/choice_button.tscn")

var choice_buttons: Array[Button] = []

func _ready():
	add_choice("this is choice 0")
	add_choice("this is choice 1")

func add_text(text: String):
	textLabel.text = text

func add_choice(choice_text: String):
	var button_obj : ChoiceButton = choice_button_tscn.instantiate()
	button_obj.choice_index = choice_buttons.size()
	choice_buttons.push_back(button_obj)
	button_obj.text = choice_text
	button_obj.choice_selected.connect(_on_choice_selected)
	vBox.add_child(button_obj)

func _on_choice_selected(choice_index: int):
	print(choice_index)

func clear_dialogue_box():
	textLabel.text = ""
	for choice in choice_buttons:
		vBox.remove_child(choice)
	choice_buttons = []


func _on_ez_dialogue_dialogue_generated(response: DialogueResponse):
	add_text(response.text)
	for choice in response.choices:
		add_choice(choice)
