extends StaticBody2D

enum POS {LEFT, RIGHT, TOP}
@onready var sprite: Sprite2D = $Sprite2D
@export var wall_pos: POS
var screen_size
var sprite_size

func _ready():
	screen_size = get_viewport_rect().size	
	sprite_size = sprite.texture.get_size()
	
	place_wall()
	set_region_size()

func set_region_size():
	var wall_size = scale * sprite_size
	sprite.region_rect.size = wall_size
	sprite.scale /= scale

func place_wall():
	if wall_pos == POS.LEFT:
		place_left()
	elif wall_pos == POS.RIGHT:
		place_right()
	else:
		place_top()
	
func place_left():
	position = Vector2(sprite_size.x / 2, screen_size.y / 2)
	scale = Vector2(1, screen_size.y / sprite_size.y)
	
func place_right():
	position = Vector2(screen_size.x - (sprite_size.x / 2), screen_size.y / 2)
	scale = Vector2(1, screen_size.y / sprite_size.y)

func place_top():
	position = Vector2(screen_size.x / 2, sprite_size.y / 2)
	scale = Vector2(screen_size.x / sprite_size.x, 1)	
