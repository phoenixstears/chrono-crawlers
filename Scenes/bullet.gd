extends Area2D

@export var speed := 50.0
var velocity := Vector2.ZERO
var can_hit_player = true

func _physics_process(delta):
	position += velocity * delta



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") && can_hit_player:
		body.take_damage()
		queue_free()
	elif body.is_in_group("Wall"):
		queue_free()
	else:
		pass
