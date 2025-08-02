extends Control

func _ready():
	MusicPlayer.play_music()
	$Clock1.hide()
	$Clock2.hide()
	$Clock3.hide()
	$Clock4.hide()
	$Clock5.hide()
	$Clock6.hide()
	$Clock7.hide()
	$Clock8.hide()
	if Global.save == false:
		$VBoxContainer/ContinueButton.disabled = true
	else:
		$VBoxContainer/ContinueButton.disabled = false

func _on_new_game_button_pressed() -> void:
	MusicPlayer.stop_music()
	Global.save_progress()
	Global.level = 0
	get_tree().change_scene_to_file("res://Scenes/level_transition_screen.tscn")
	
func _on_new_game_button_mouse_entered() -> void:
	$Clock1.show()
	$Clock2.show()

func _on_new_game_button_mouse_exited() -> void:
	$Clock1.hide()
	$Clock2.hide()
	
	
func _on_continue_button_pressed() -> void:
	MusicPlayer.stop_music()
	get_tree().change_scene_to_file("res://Scenes/level_transition_screen.tscn")
	
func _on_continue_button_mouse_entered() -> void:
	$Clock3.show()
	$Clock4.show()

func _on_continue_button_mouse_exited() -> void:
	$Clock3.hide()
	$Clock4.hide()

func _on_settings_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/settings.tscn")


func _on_settings_button_mouse_entered() -> void:
	$Clock5.show()
	$Clock6.show()

func _on_settings_button_mouse_exited() -> void:
	$Clock5.hide()
	$Clock6.hide()


func _on_exit_button_pressed() -> void:
	get_tree().quit()
	
func _on_exit_button_mouse_entered() -> void:
	$Clock7.show()
	$Clock8.show()
	
func _on_exit_button_mouse_exited() -> void:
	$Clock7.hide()
	$Clock8.hide()
