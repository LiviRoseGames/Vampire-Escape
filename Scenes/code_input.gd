extends Node2D

const DESK_PW = "RICK"
const SIDETBL_PW = "1872"

var password : String
var inputArray = []
var lockArray = []

@export var type : String

@onready var lineEdit = $LineEdit
@onready var lock0 = $Label0
@onready var lock1 = $Label1
@onready var lock2 = $Label2
@onready var lock3 = $Label3

# Called when the node enters the scene tree for the first time.
func _ready():
	if type == "desk":
		password = DESK_PW
	elif type == "sidetable":
		password = SIDETBL_PW
	lockArray = [lock0, lock1, lock2, lock3]
	defaultLocks()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to_file("res://Scenes/room.tscn")
	


func _on_line_edit_text_changed(new_text):
	if not new_text == "":
		inputArray = new_text
	
	checkLock(0)
	checkLock(1)
	checkLock(2)
	checkLock(3)
	
	if lineEdit.text == password:
		gainCheckpoint()

func defaultLocks():
	lock0.text = "*"
	lock1.text = "*"
	lock2.text = "*"
	lock3.text = "*"

func checkLock(lockNumber):
	if len(inputArray) > lockNumber:
		lockArray[lockNumber].text = inputArray[lockNumber]
	else:
		lockArray[lockNumber].text = "*"

func gainCheckpoint():
	if type == "desk":
		GlobalManager.hasDesk = true
	elif type == "sidetable":
		GlobalManager.hasBook = true
