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
				object.take_damage(2)
		check_if_pillar_close()
	if !animation.is_playing():
		queue_free()
	
func check_if_pillar_close():
	for body in get_tree().get_nodes_in_group("TrialPillar"):
		if global_position.distance_to(body.global_position) < 25:
			body.destroy()
