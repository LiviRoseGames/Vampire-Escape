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

#progression
var hasBlood : bool = false
var hasMirror : bool = false
var hasBook : bool = false
var hasDesk : bool = false

#timer needs
var gameStarted : bool = false
var gameOver : bool = false
var counter : int = 0

var resource = load("res://dialogue/hunger.dialogue")

@onready var timer = $Timer

func _process(delta):
	if inRoom:
		get_tree().change_scene_to_file("res://Scenes/room.tscn")

func StartTimer():
	timer.start(1)

func _on_timer_timeout():
	counter += 1
	print(counter)
	
	if counter == 180:
		DialogueManager.show_dialogue_balloon(resource, "h1")
	elif counter == 270:
		DialogueManager.show_dialogue_balloon(resource, "h2")
	elif counter == 360:
		DialogueManager.show_dialogue_balloon(resource, "h3")
	elif counter == 380:
		DialogueManager.show_dialogue_balloon(resource, "h4")
		gameOver = true
		
