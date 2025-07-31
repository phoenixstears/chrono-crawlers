extends CharacterBody2D

@export var bullet_scene: PackedScene
@onready var bullet_spawn = $BulletSpawnPoint
@onready var target = $"../Player"


var speed = 30
func _physics_process(delta: float) -> void:
	var distance = self.global_position.distance_to(target.global_position)
	var direction = (target.global_position - global_position).normalized()
	if distance > 70:
		velocity = direction * speed
		move_and_slide()
		$Timer.set_paused(true)
	elif distance < 50: 
		velocity = direction.rotated(PI) * speed
		move_and_slide()
		if $Timer.is_paused():
			$Timer.set_paused(false)
		if $Timer.is_stopped():
			$Timer.start(1.0)
	else:
		if $Timer.is_paused():
			$Timer.set_paused(false)
		if $Timer.is_stopped():
			$Timer.start(1.0)

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)  
	bullet.global_position = bullet_spawn.global_position
	print(bullet.global_position)
	var direction = (target.global_position - bullet_spawn.global_position).normalized()
	bullet.velocity = direction * bullet.speed


func _on_timer_timeout() -> void:
	shoot_bullet()
