extends Area2D

@export var speed := 50.0
var velocity := Vector2.ZERO

func _physics_process(delta):
	position += velocity * delta

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Enemy"):
		queue_free()
	elif body.is_in_group("Wall"):
		queue_free()
	else:
		pass
