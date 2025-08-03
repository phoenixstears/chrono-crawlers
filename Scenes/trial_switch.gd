extends Area2D


@export var toggled = false

func _process(delta: float):
	var objs = get_overlapping_areas()
	for body in objs:
		if body.is_in_group("Bullet") and !toggled:
			$Sprite.play("on")
			toggled = true
			body.queue_free()
		
