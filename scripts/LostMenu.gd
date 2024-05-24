extends Control

var screen_size

func _ready():
	screen_size = get_viewport_rect().size
	position = Vector2(screen_size.x/2, screen_size.y/2)

func _on_restart_button_pressed():
	get_tree().reload_current_scene()

func _on_menu_button_pressed():
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
