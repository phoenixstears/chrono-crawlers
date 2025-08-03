class_name PriestDeadState
extends BaseState

func enter_state() -> void:
	state_type = BaseState.State.DEAD
	character_animation.play("dead")
	if (player_root.get_node("Pivot/NecromancerDrainArea/Node2D") != null):
		player_root.get_node("Pivot/NecromancerDrainArea/Node2D").visible = false

func check_and_transition_to_idle() -> bool:
	return false
func check_and_transition_to_walking() -> bool:
	return false
func check_and_transition_to_attack() -> bool:
	return false
func check_and_transition_to_dead() -> bool:
	return false
func check_and_transition_to_ability() -> bool:
	return false
