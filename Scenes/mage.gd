extends CharacterBody2D

@export var bullet_scene: PackedScene
@onready var bullet_spawn = $BulletSpawnPoint
@onready var target = $"../Player"
@onready var animation = $Mage

var max_hp = 3
var current_hp = 3

var speed = 30
func _physics_process(delta: float) -> void:
	var distance = self.global_position.distance_to(target.global_position)
	var direction = (target.global_position - global_position).normalized()
	if animation.animation == "attack" && animation.frame == 9:
		shoot_bullet()
		animation.play("idle")
	elif animation.animation != "attack":
		if distance > 70:
			velocity = direction * speed
			move_and_slide()
			$Timer.set_paused(true)
			if animation.animation != "walk":
				animation.play("walk")
		elif distance < 50: 
			velocity = direction.rotated(PI) * speed
			move_and_slide()
			if $Timer.is_paused():
				$Timer.set_paused(false)
			if $Timer.is_stopped():
				$Timer.start(2.0)
			if animation.animation != "walk":
				animation.play("walk")
		else:
			if $Timer.is_paused():
				$Timer.set_paused(false)
			if $Timer.is_stopped():
				$Timer.start(2.0)
	

		

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	get_parent().add_child(bullet)  
	bullet.global_position = bullet_spawn.global_position
	var direction = (target.global_position - bullet_spawn.global_position).normalized()
	bullet.velocity = direction * bullet.speed


func _on_timer_timeout() -> void:
	animation.play("attack")

func take_damage(dmg):
	current_hp -= dmg
	if current_hp < 0:
		set_process(false)
		set_physics_process(false)
		$CollisionShape2D.disabled = true
		animation.play("dead")
		await $Mage.animation_finished
		queue_free()
		$Timer.set_paused(true)
