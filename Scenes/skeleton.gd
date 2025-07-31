extends CharacterBody2D

@onready var target = $"../Player"
var speed = 55
func _physics_process(delta: float) -> void:
	var direction = (target.global_position - global_position).normalized()
	velocity = direction * speed
	move_and_slide()
