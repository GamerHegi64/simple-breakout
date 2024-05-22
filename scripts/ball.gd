extends CharacterBody2D

@export var speed = 300
	
func _physics_process(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity = velocity.rotated(deg_to_rad(randf_range(-10, 10)))
		
		if collision.get_collider().has_method('hit_by_ball'):
			collision.get_collider().hit_by_ball()
	
func start(_position, _direction = 0):
	position = _position
	rotation = _direction
	velocity = Vector2(	0 , speed).rotated(rotation)
	


