extends Area2D

@onready var swing_animation = $WarriorSwingAnimation

func _process(delta):
	if !swing_animation.is_playing():
		look_at(get_global_mouse_position())
