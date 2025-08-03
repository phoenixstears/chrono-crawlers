extends Control


func _ready():
	$music.play()

func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
