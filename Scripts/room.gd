extends Node2D

@onready var animPlayer = $AnimationPlayer

var resource = load("res://dialogue/intro.dialogue")

var introStarted : bool = false
var introDone : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not GlobalManager.gameStarted and not introStarted:
		DialogueManager.show_dialogue_balloon(resource, "intro")
		introStarted = true
	
	if GlobalManager.gameStarted and not introDone:
		animPlayer.play("FadeIn")
		GlobalManager.StartTimer()
		introDone = true
	
	if GlobalManager.gameOver:
		animPlayer.play_backwards("FadeIn")

func _on_animation_player_animation_finished(anim_name):
	if GlobalManager.gameOver:
		get_tree().change_scene_to_file("res://Scenes/Menu/game_over.tscn")
