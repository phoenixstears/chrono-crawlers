extends Control

func _ready():
	$Clock1.hide()
	$Clock2.hide()
	$Clock3.hide()
	$Clock4.hide()
	$Clock5.hide()
	$Clock6.hide()
	$Clock7.hide()
	$Clock8.hide()

func _on_new_game_button_pressed() -> void:
	MusicPlayer.stop_music()
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	
func _on_new_game_button_mouse_entered() -> void:
	$Clock1.show()
	$Clock2.show()

func _on_new_game_button_mouse_exited() -> void:
	$Clock1.hide()
	$Clock2.hide()
	
	
func _on_continue_button_pressed() -> void:
	MusicPlayer.stop_music()
	
func _on_continue_button_mouse_entered() -> void:
	$Clock3.show()
	$Clock4.show()

func _on_continue_button_mouse_exited() -> void:
	$Clock3.hide()
	$Clock4.hide()

func _on_settings_button_pressed() -> void:
	pass # Replace with function body.


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
