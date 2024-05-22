extends StaticBody2D

@onready var collision_shape_2d = $CollisionShape2D

func hit_by_ball():
	queue_free()
	
func start(_position):
	position = _position

func get_size():
	return $CollisionShape2D.shape.get_rect().size
