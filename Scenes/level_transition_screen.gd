extends Node2D



func _ready():
	Global.save_progress(Global.level)
	Global.circle_relic_acquired = false
	Global.triangle_relic_acquired = false
	Global.square_relic_acquired = false
	for i in range (0,Global.level):
		$Label.text+= "?"
	$AudioStreamPlayer.play()
	await get_tree().create_timer(5).timeout
	get_tree().change_scene_to_file("res://Scenes/Level1.tscn")
	
