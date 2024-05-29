extends Node2D

var score = 0

@onready var player = $Player
@onready var player_spawn = $PlayerSpawn
@onready var ball_spawn = $BallSpawn
@onready var lost_menu = $LostMenu
@onready var won_menu = $WonMenu
@export var ball_scene: PackedScene
@export var max_ball_count = 1
var current_ball_count = 0
var ball

# Called when the node enters the scene tree for the first time.
func _ready():
	prepare_new_game()
	await get_tree().create_timer(1.0).timeout
	new_game()
	
func prepare_new_game():
	lost_menu.hide()
	won_menu.hide()
	player.set_pos(player_spawn.position)
	new_ball()
	
func new_game():
	score = 0
	player.start()
	ball.start()
	
func new_ball():
	ball = ball_scene.instantiate()
	ball.set_pos(ball_spawn.position)
	add_child(ball)

func lost_game():
	player.stop()
	ball.stop()
	lost_menu.show()

func won_game():
	player.stop()
	ball.stop()
	won_menu.show()

func _on_losing_area_body_entered(body):
	if body.is_in_group('ball'):
		lost_game()


func _on_block_spawner_no_blocks():
	won_game()
