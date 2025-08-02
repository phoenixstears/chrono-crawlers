class_name PriestAttackState
extends BaseState

var bullet_scene = preload("res://Scenes/PriestProjectile.tscn")
var bullet_spawn 
var can_shoot

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")
	bullet_spawn = player_root.get_node("Pivot")
	can_shoot = true

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
		can_shoot = false

func shoot_bullet():
	var bullet = bullet_scene.instantiate()
	player_root.get_tree().current_scene.add_child(bullet)  
	bullet.global_position = bullet_spawn.global_position
	var direction = Vector2.RIGHT.rotated(bullet_spawn.rotation)
	bullet.velocity = direction * bullet.speed
