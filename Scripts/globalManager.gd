extends Node

#scene management
var inRoom = false

#friend specific
var hasMetFriend : bool = false
var friendResp : bool = false

#desk specific
var examiningLock : bool = false
var examiningDiary : bool = false
var deskUnlock : bool = false

#bedsidetable specific
var examiningBSLock : bool = false
var bookRead : bool = false

#progression
var hasBlood : bool = false
var hasMirror : bool = false
var hasBook : bool = false
var hasDesk : bool = false

#timer needs
var gameStarted : bool = false
var gameOver : bool = false
var counter : int = 0
var gameWin : bool = false
var endScreen : bool = false

var resource = load("res://dialogue/hunger.dialogue")

@onready var timer = $Timer

func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/room.tscn")
	
	if inRoom:
		get_tree().change_scene_to_file("res://Scenes/room.tscn")
	
	if hasBook and hasBlood and hasMirror:
		gameWin = true

func StartTimer():
	timer.start(1)

func _on_timer_timeout():
	counter += 1
	print(counter)
	
	if counter == 45:
		DialogueManager.show_dialogue_balloon(resource, "h1")
	elif counter == 75:
		DialogueManager.show_dialogue_balloon(resource, "h2")
	elif counter == 90:
		DialogueManager.show_dialogue_balloon(resource, "h3")
	elif counter == 100:
		DialogueManager.show_dialogue_balloon(resource, "h4")
		gameOver = true
		

func resetVariables():
	#scene management
	inRoom = false
	
	hasMetFriend = false
	friendResp = false

	examiningLock = false
	examiningDiary = false
	deskUnlock = false

	examiningBSLock = false
	bookRead = false
	hasBlood = false
	hasMirror = false
	hasBook = false
	hasDesk = false

	gameStarted = false
	gameOver = false
	counter = 0
	gameWin = false
	endScreen = false
