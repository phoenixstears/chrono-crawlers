class_name FarmerAttackState
extends BaseState

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")

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
