extends Area2D
@onready var player = $"../../Player"
@onready var skeleton = $"../../Skeleton"

func _process(delta: float) -> void:
	if  skeleton != null and !skeleton.slashing:
		look_at(player.global_position)
		if rotation > 90 || rotation < -90:
			skeleton.get_node("Skeleton").flip_h = true
		else:
			skeleton.get_node("Skeleton").flip_h = false
