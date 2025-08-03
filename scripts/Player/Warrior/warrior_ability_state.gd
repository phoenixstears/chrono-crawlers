class_name WarriorAbilityState
extends BaseState

var corpse_found = false
var hit_enemies_set = []

func enter_state() -> void:
	corpse_found = false
	state_type = BaseState.State.ABILITY
	character_animation.play("ability")

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
	if !character_animation.is_playing() && Input.is_action_just_pressed("mouse_left"):
		state_controller.transition_to_state(BaseState.State.ATTACK)
	return true
func check_and_transition_to_dead() -> bool:
	return false


func process_state(delta: float) -> void:
	if Input.is_action_just_pressed("left") && !character_animation.flip_h:
		character_animation.flip_h = true
	if Input.is_action_just_pressed("right") && character_animation.flip_h:
		character_animation.flip_h = false
		
	if !corpse_found:
		for body in player_root.get_tree().get_nodes_in_group("Corpse"):
			if player_root.global_position.distance_to(body.global_position) < 30:
				player_root.warrior_stats["damage"] += 1
				player_root.warrior_stats["attack_speed"] += 1.0
				body.interact()
				corpse_found = true
	
	
