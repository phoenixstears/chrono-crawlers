extends Node


func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			toggle_pause()
func toggle_pause():
	get_tree().paused = true
	$PauseMenu.visible = true
