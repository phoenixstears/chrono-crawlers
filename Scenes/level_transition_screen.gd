extends Node2D



func _ready():
	for i in range (0,Global.level):
		$Label.text+= "?"
	$AudioStreamPlayer.play()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	
