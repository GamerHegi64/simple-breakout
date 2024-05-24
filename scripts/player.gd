extends CharacterBody2D

@export var speed = 500
var can_move = false

func _physics_process(delta):
	if can_move:
		proces_controll(delta)

func proces_controll(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	move_and_collide(velocity * delta * speed)

func set_pos(_position):
	position = _position
	
func start():
	can_move = true
	
func stop():
	can_move = false

	
