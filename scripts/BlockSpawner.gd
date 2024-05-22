extends Node

@export var block_scene: PackedScene
@export var spawn_marker: Marker2D
@export var cols = 10
@export var rows = 6
@export var col_gap = 10
@export var row_gap = 15

func _ready():
	spawn_grid()

func spawn_grid():
	var temp_block = block_scene.instantiate()
	var block_width = temp_block.get_size().x
	var block_height = temp_block.get_size().y
	var row_width = (block_width * cols) + (col_gap * (cols - 1))
	temp_block.queue_free()
	
	var spawn_position = Vector2(
		spawn_marker.position.x - row_width/2 + block_width/2,
		spawn_marker.position.y
	)
	
	var _spawn_position = spawn_position
	for i in rows:
		for j in cols:
			var block = block_scene.instantiate()
			add_child(block)
			block.set_position(_spawn_position)
			_spawn_position.x += block_width+col_gap
		spawn_position.y += row_gap + block_height
		_spawn_position = spawn_position

