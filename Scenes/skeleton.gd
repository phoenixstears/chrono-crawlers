extends CharacterBody2D

@onready var target = $"../Player"
@onready var animation = $Skeleton
@onready var slash_area = $Area2D
@onready var slash_animation = $Area2D/AnimatedSprite2D

var speed = 55
var max_hp = 5
var current_hp = 5

var slashing = false
var can_hit = true

func _ready() -> void:
	slash_animation.visible = false
	animation.play("chase")

func _physics_process(delta: float) -> void:
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
		var distance = self.global_position.distance_to(target.global_position)
		var direction = (target.global_position - global_position).normalized()
		velocity = direction * speed
		if distance > 15:
			move_and_slide()
		else:
			attack_player()
	
	if !slash_animation.is_playing():
		slash_animation.visible = false

func attack_player():
	animation.play("attack")
	slashing = true

func take_damage(dmg):
	print("taking dmg")
	current_hp -= dmg
	if current_hp <= 0:
		set_process(false)
		set_physics_process(false)
		$Skeleton.play("dead")
		$CollisionShape2D.disabled = true
		
	
