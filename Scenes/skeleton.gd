extends CharacterBody2D

@onready var target = $"../Player"
var is_attacking = false
var speed = 55
func _physics_process(delta: float) -> void:
	if is_attacking == false:
		var distance = self.global_position.distance_to(target.global_position)
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * speed
		if distance > 15:
			move_and_slide()
		else:
			attack_player()
func attack_player():
	$Skeleton.play("attack")
	is_attacking = true
	await $Skeleton.animation_finished
	is_attacking = false
	$Skeleton.play("chase")
