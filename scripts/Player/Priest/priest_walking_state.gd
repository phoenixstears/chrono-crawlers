class_name PriestWalkingState
extends BaseState

func enter_state() -> void:
	state_type = BaseState.State.WALKING
	character_animation.play("walking")

func check_and_transition_to_idle() -> bool:
	if player_root.velocity == Vector2.ZERO:
		state_controller.transition_to_state(BaseState.State.IDLE)
	return false
func check_and_transition_to_walking() -> bool:
	return false
func check_and_transition_to_dead() -> bool:
	return false
