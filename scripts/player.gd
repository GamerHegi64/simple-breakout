extends CharacterBody2D

@export var speed = 500

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
		
	move_and_collide(velocity * delta * speed)

func start(pos):
	position = pos

	
