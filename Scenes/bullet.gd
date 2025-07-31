extends Area2D

@export var speed := 50.0
var velocity := Vector2.ZERO

func _physics_process(delta):
	position += velocity * delta



func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
		queue_free()
	elif body.is_in_group("Wall"):
		queue_free()
	else:
		pass
