extends Node2D

const SPEED = 200

var astar_grid: AStarGrid2D
var current_id_path: Array[Vector2i]

#@onready var animPlayer = $AnimationPlayer
@onready var tileMap = $"../TileMap"

func _ready() -> void:
	#animPlayer.play("Idle")
	
#Astar grid code
	astar_grid = AStarGrid2D.new()
	astar_grid.region = tileMap.get_used_rect()
	astar_grid.cell_size = Vector2(16,32)
	astar_grid.diagonal_mode = AStarGrid2D.DIAGONAL_MODE_ONLY_IF_NO_OBSTACLES
	astar_grid.update()
	
	for x in tileMap.get_used_rect().size.x:
		for y in tileMap.get_used_rect().size.y:
			var tile_position = Vector2i(
				x + tileMap.get_used_rect().position.x,
				y + tileMap.get_used_rect().position.y
			)
			
			var tile_data = tileMap.get_cell_tile_data(0, tile_position)
			
			if tile_data == null or tile_data.get_custom_data("walkable") == false:
				astar_grid.set_point_solid(tile_position)
	

func _physics_process(delta : float) -> void:
	if current_id_path.is_empty():
		return
	
	var target_position = tileMap.map_to_local(current_id_path.front())
	
	global_position = global_position.move_toward(target_position, 1)
	
	if global_position == target_position:
		current_id_path.pop_front()



func _input(event):
	if event.is_action_pressed("move") == false:
		return
	
	var id_path = astar_grid.get_id_path(
		tileMap.local_to_map(global_position),
		tileMap.local_to_map(get_global_mouse_position())
	).slice(1)
	
	if id_path.is_empty() == false:
		current_id_path = id_path
