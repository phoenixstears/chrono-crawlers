class_name WarriorIdleState
extends BaseState

func enter_state() -> void:
	state_type = BaseState.State.IDLE
	character_animation.play("idle")

func check_and_transition_to_idle() -> bool:
	return false

func check_and_transition_to_dead() -> bool:
	return false
