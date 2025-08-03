extends Node2D

var skeleton_scene = preload("res://Scenes/mage.tscn")
	
func init_spawn(seconds):
	$Timer.wait_time = seconds
	$Timer.start()
	
func _on_timer_timeout() -> void:
	var skeleton = skeleton_scene.instantiate()
	get_parent().add_child(skeleton)  
	skeleton.global_position = global_position
	queue_free()
