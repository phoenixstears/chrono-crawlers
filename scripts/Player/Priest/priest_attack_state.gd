class_name PriestAttackState
extends BaseState

var chicken_scene = preload("res://Scenes/exploding_chicken.tscn")
var bullet_scene = preload("res://Scenes/PriestProjectile.tscn")
var bullet_spawn 
var can_shoot

# Ability attack warrior
var swing_animation
var swing_area
var slashing = false
var hit_enemies_set = []

# Ability attack necromancer
var necromancer_drain_area
var area_indicator 
var drained_enemies_set = []

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")
	
	bullet_spawn = player_root.get_node("Pivot")
	can_shoot = true
	
	swing_animation = player_root.get_node("Pivot/WarriorSwingAnimation")
	swing_area = player_root.get_node("Pivot")
	
	necromancer_drain_area = player_root.get_node("Pivot/NecromancerDrainArea")
	area_indicator = necromancer_drain_area.get_node("Node2D")
	if player_root.priest_unlocks["necromancer"]:
		area_indicator.visible = true

func check_and_transition_to_idle() -> bool:
	if !character_animation.is_playing() && player_root.velocity == Vector2.ZERO:
		state_controller.transition_to_state(BaseState.State.IDLE)
		return true
	return false
func check_and_transition_to_walking() -> bool:
	if !character_animation.is_playing() && check_movement_inputs():
		state_controller.transition_to_state(BaseState.State.WALKING)
	return false
func check_and_transition_to_attack() -> bool:
	return false
func check_and_transition_to_dead() -> bool:
	return false

func process_state(delta: float) -> void:
	if Input.is_action_just_pressed("left") && !character_animation.flip_h:
		character_animation.flip_h = true
	if Input.is_action_just_pressed("right") && character_animation.flip_h:
		character_animation.flip_h = false
	if character_animation.frame == 5 && can_shoot:
		shoot_bullet()
		if player_root.priest_unlocks["necromancer"]:
			drain()
			area_indicator.visible = false
		if player_root.priest_unlocks["warrior"]:
			slash()
		if player_root.priest_unlocks["priest"]:
			shoot_bullet_enchanced()
		if player_root.priest_unlocks["farmer"]:
			place_chicken()
		can_shoot = false

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	player_root.get_tree().current_scene.add_child(bullet)  
	bullet.global_position = bullet_spawn.global_position
	var direction = Vector2.RIGHT.rotated(bullet_spawn.rotation)
	bullet.velocity = direction * bullet.speed

func shoot_bullet_enchanced():
	var bullet = bullet_scene.instantiate()
	player_root.get_tree().current_scene.add_child(bullet)  
	bullet.global_position = bullet_spawn.global_position
	var direction = Vector2.RIGHT.rotated(bullet_spawn.rotation)
	bullet.velocity = direction * bullet.speed * 2
	for i in [-PI/6, PI/6]:
		var slow_bullet = bullet_scene.instantiate()
		player_root.get_tree().current_scene.add_child(slow_bullet)  
		slow_bullet.global_position = bullet_spawn.global_position
		var slow_bullet_direction = Vector2.RIGHT.rotated(bullet_spawn.rotation + i)
		slow_bullet.velocity = slow_bullet_direction * slow_bullet.speed

func place_chicken():
	var chicken = chicken_scene.instantiate()
	player_root.get_tree().current_scene.add_child(chicken)  
	chicken.global_position = bullet_spawn.global_position

func slash():
	for object in swing_area.get_overlapping_bodies():
		if (object.is_in_group("Enemy") || object.is_in_group("Throne") || object.is_in_group("King")) and not object in hit_enemies_set:
			hit_enemies_set.append(object)
			object.take_damage(2 + player_root.powerup_damage)

func drain():
	for object in necromancer_drain_area.get_overlapping_bodies():
		if (object.is_in_group("Enemy") || object.is_in_group("King") || object.is_in_group("Throne")) and not object in drained_enemies_set:
			object.take_damage(1 + player_root.powerup_damage)
			drained_enemies_set.append(object)
