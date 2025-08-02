class_name WarriorAttackState
extends BaseState

var swing_animation
var swing_area
var slashing = false
var hit_enemies_set = []

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")
	swing_animation = player_root.get_node("Pivot/WarriorSwingAnimation")
	swing_area = player_root.get_node("Pivot")

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
		
	if character_animation.frame == 2:
		swing_animation.visible = true
		swing_animation.play("default")
		slashing = true
	if swing_animation.frame == 1:
		slashing = false
		
	if !swing_animation.is_playing():
		swing_animation.visible = false
		hit_enemies_set = []
		
	if slashing:
		for object in swing_area.get_overlapping_bodies():
			if object.is_in_group("Enemy") and not object in hit_enemies_set:
				hit_enemies_set.append(object)
				object.take_damage(2)
	
	
	
	

	
