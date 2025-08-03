extends Area2D

var hit_enemies_set = []
@onready var animation = $AnimatedSprite2D
var exploding = false

func _ready() -> void:
	animation.play("default")

func _physics_process(delta: float) -> void:
	if (animation.frame == 4):
		exploding = true
	if (animation.frame == 6):
		exploding = false
	if exploding:
		for object in get_overlapping_bodies():
			if (object.is_in_group("Enemy") || object.is_in_group("King") || object.is_in_group("Throne")) and not object in hit_enemies_set:
				hit_enemies_set.append(object)
				object.take_damage(2 + get_tree().current_scene.get_node("Player").powerup_damage)
	if !animation.is_playing():
		queue_free()
	
