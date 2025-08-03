extends StaticBody2D

var atk_scene = preload("res://Scenes/PowerupAttack.tscn")
var atk = atk_scene.instantiate()
var spd_scene = preload("res://Scenes/PowerupSpeed.tscn")
var spd = spd_scene.instantiate()
var clock_scene = preload("res://Scenes/PowerupSpecial.tscn")
var clock = clock_scene.instantiate()


func _ready():
	randomize()
	
func open():
	var random = randi_range(1,3)
	match random:
		1:
			get_parent().add_child(atk)
			atk.global_position = global_position
			queue_free()
		2:
			get_parent().add_child(spd)
			spd.global_position = global_position
			queue_free()
		3:
			get_parent().add_child(clock)
			clock.global_position = global_position
			queue_free()
