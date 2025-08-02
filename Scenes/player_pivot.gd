extends Area2D

@onready var swing_animation = $WarriorSwingAnimation
@export var can_slash = false

func _process(delta):
	if !swing_animation.is_playing():
		look_at(get_global_mouse_position())

func _on_body_entered(body):
	if body.is_in_group("Enemy") && can_slash:
		print("Enemy entered area")
