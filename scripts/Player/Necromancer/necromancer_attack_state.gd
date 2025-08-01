class_name NecromancerAttackState
extends BaseState

var necromancer_drain_area
var drain_dict: Dictionary = {}
const drain_counter_requirement = 100

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")
	necromancer_drain_area = player_root.get_node("Pivot/NecromancerDrainArea")

func check_and_transition_to_idle() -> bool:
	if !Input.is_action_pressed("mouse_left") && player_root.velocity == Vector2.ZERO:
		state_controller.transition_to_state(BaseState.State.IDLE)
		return true
	return false
func check_and_transition_to_walking() -> bool:
	if !Input.is_action_pressed("mouse_left") && check_movement_inputs():
		state_controller.transition_to_state(BaseState.State.IDLE)
		return true
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
		
	for object in necromancer_drain_area.get_overlapping_bodies():
		if object is CharacterBody2D && object.is_in_group("Enemy"):
			if object in drain_dict:
				drain_dict[object] += 1
				if drain_dict[object] == 100:
					drain_dict[object] = 0
			else:
				drain_dict[object] = 0
	
	print(drain_dict)
