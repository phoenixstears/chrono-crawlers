extends Area2D

@onready var player = $"../../Player"
@onready var skeleton = $"../../Skeleton"

func _process(delta: float) -> void:
	if  skeleton != null and !skeleton.slashing:
		look_at(player.global_position)
