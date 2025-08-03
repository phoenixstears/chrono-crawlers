extends Area2D

@onready var player = $"../../Player"
@onready var king = $"../../King"

func _process(delta: float) -> void:
	if !king.slashing_currently:
		look_at(player.position)
