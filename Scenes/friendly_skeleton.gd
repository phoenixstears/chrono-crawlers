extends CharacterBody2D

var attacking = false
var hit_enemies_set = []
@onready var animation = $Skeleton
@onready var slash_area = $Area2D
@onready var slash_animation = $Area2D/AnimatedSprite2D

var alive = false

func _process(delta: float) -> void:
	if($"../../Player" != null):
		if $"../../Player".velocity.x < 0:
			animation.flip_h = true
		else:
			animation.flip_h = false
	
	if !alive:
		return
	else:
		if !visible:
			visible = true
	
	if (Input.is_action_pressed("mouse_left") && !attacking && !animation.animation == "attack"):
		attacking = true
		animation.play("attack")
	elif !attacking && (Input.is_action_pressed("down") || Input.is_action_pressed("up") || Input.is_action_pressed("left") || Input.is_action_pressed("right")):
		if animation.animation != "walk":
			animation.play("walk")
	elif !attacking:
		if animation.animation != "idle":
			animation.play("idle")
			
	if attacking:
		if animation.frame == 6:
			slash_area.visible = true
			if !slash_animation.is_playing():
				slash_animation.play("default")
		if (animation.frame == 6 || animation.frame == 7):
			for object in slash_area.get_overlapping_bodies():
				if (object.is_in_group("Enemy") || object.is_in_group("King") || object.is_in_group("Throne")) and not object in hit_enemies_set:
					object.take_damage(1)
					hit_enemies_set.append(object)
		if animation.frame == 13:
			attacking = false
		if slash_animation.frame == 2:
			slash_area.visible = false
		
