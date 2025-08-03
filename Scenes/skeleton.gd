extends CharacterBody2D

@onready var target = $"../Player"
@onready var animation = $Skeleton
@onready var slash_area = $Area2D
@onready var slash_animation = $Area2D/AnimatedSprite2D
@onready var nav_agent = $NavigationAgent2D

var speed = 55
var max_hp = 5
var current_hp = 5

var slashing = false
var can_hit = true
var spawning = true

func _ready() -> void:
	slash_animation.visible = false
	animation.play("spawn")

func _physics_process(delta: float) -> void:
	if spawning:
		if animation.frame == 6:
			spawning = false
		return
	if animation.animation == "attack":
		if animation.frame == 4:
			slash_animation.visible = true
			slash_animation.play("default")
		if can_hit && (animation.frame == 4 || animation.frame == 5):
			for object in slash_area.get_overlapping_bodies():
				if object.is_in_group("Player"):
					object.take_damage
					can_hit = false
		elif animation.frame == 13:
			slashing = false
			animation.play("chase")
	else:
			nav_agent.target_position = target.global_position
			if nav_agent.is_navigation_finished():
				return

			var next_point = nav_agent.get_next_path_position()
			var direction = (next_point - global_position).normalized()
			var distance = self.global_position.distance_to(target.global_position)
			if distance > 15:
				position += direction * speed * delta
			else:
				attack_player()
	
	if !slash_animation.is_playing():
		slash_animation.visible = false

func attack_player():
	animation.play("attack")
	slashing = true

func take_damage(dmg):
	current_hp -= dmg
	if current_hp <= 0:
		set_process(false)
		set_physics_process(false)
		$DeathSound.play()
		$Skeleton.play("dead")
		await $Skeleton.animation_finished
		queue_free()
		$CollisionShape2D.disabled = true
		
	
