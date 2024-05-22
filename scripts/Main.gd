extends Node2D

var score = 0

@export var ball_scene: PackedScene
@export var max_ball_count = 1
var current_ball_count = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	new_ball()
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func new_game():
	score = 0
	$Player.start($PlayerSpawn.position)
	
func new_ball():
	var ball = ball_scene.instantiate()
	
	ball.start($BallSpawner.position)
	
	add_child(ball)
