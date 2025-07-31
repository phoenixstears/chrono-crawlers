extends Control


func _ready():
	$"VBoxContainer/HBoxContainer/HSlider".value = Global.sound_volume
	$Clock1.hide()
	$Clock2.hide()


func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")


func _on_button_mouse_entered() -> void:
	$Clock1.show()
	$Clock2.show()


func _on_button_mouse_exited() -> void:
	$Clock1.hide()
	$Clock2.hide()
