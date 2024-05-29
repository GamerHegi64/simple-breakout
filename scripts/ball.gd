extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@export var base_speed = 350
@export var charged_boost = 100
@export var is_moving = false
var speed = base_speed
	
func _physics_process(delta):
	if is_moving:
		move_and_bounce(delta)
	
func move_and_bounce(delta):
	var collision = move_and_collide(velocity * delta * speed)
	if collision:
		velocity = velocity.bounce(collision.get_normal())
		velocity = velocity.rotated(deg_to_rad(randf_range(-10, 10)))
		
		if collision.get_collider().has_method('hit_by_ball'):
			collision.get_collider().hit_by_ball()
			
		if collision.get_collider().is_in_group("player"):
			animated_sprite.play("charged")
			speed += charged_boost
		if collision.get_collider().is_in_group("block"):
			animated_sprite.play("idle")
			speed = base_speed

func set_pos(_position):
	position = _position
	velocity = Vector2(0, 1)
	
func start():
	is_moving = true
	
func stop():
	is_moving = false
	


