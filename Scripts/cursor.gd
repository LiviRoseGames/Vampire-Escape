extends Area2D

const MIN_MOVE = 20

var overObject : bool = false
var cursor_PlayerStop
var playerCoordinates : Vector2
var oldPlayerCoordinates : Vector2

signal movePlayer(sig_MoveCoordinates)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	global_position = get_global_mouse_position()

#if were inside an objects area2d then we go to the object. if we are not, we go to the mouse.

func _input(event):
	if event is InputEventMouseButton:
		if overObject:
			playerCoordinates = cursor_PlayerStop
		elif not overObject:
			playerCoordinates = get_global_mouse_position()
		minimumMovementCheck()

func minimumMovementCheck():
	var distance = oldPlayerCoordinates - playerCoordinates
	if abs(distance.x) > MIN_MOVE or abs(distance.y) > MIN_MOVE:
		emit_signal("movePlayer", playerCoordinates)
		oldPlayerCoordinates = playerCoordinates
		print(distance)

func _on_area_entered(area):
	overObject = true

func _on_area_exited(area):
	overObject = false

func _on_object_send_player_stop(sig_PlayerStop):
	cursor_PlayerStop = sig_PlayerStop
