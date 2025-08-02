extends Node2D



func _ready():
	Global.level = 0
	
	
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ESCAPE:
				get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
			else:
				get_tree().change_scene_to_file("res://Scenes/level_transition_screen.tscn")
