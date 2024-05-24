extends CharacterBody2D

@export var speed = 400
@export var is_moving = false
	
func _physics_process(delta):
	if is_moving:
		move_and_bounce(delta)
	
func move_and_bounce(delta):
	var collision = move_and_collide(velocity * delta)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity = velocity.rotated(deg_to_rad(randf_range(-10, 10)))
		
		if collision.get_collider().has_method('hit_by_ball'):
			collision.get_collider().hit_by_ball()

func set_pos(_position):
	position = _position
	velocity = Vector2(	0 , speed).rotated(0)
	
func start():
	is_moving = true
	
func stop():
	is_moving = false
	


