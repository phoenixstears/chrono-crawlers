extends CanvasLayer




func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_ESCAPE:
				get_tree().paused = false
				get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
			else:
				self.visible = false
				get_tree().paused = false
