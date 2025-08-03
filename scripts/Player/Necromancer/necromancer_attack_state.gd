class_name NecromancerAttackState
extends BaseState

var necromancer_drain_area
var area_indicator 
var drain_dict: Dictionary = {}
const drain_counter_requirement = 100
#var tether = preload("res://Scenes/tether.tscn")

func enter_state() -> void:
	state_type = BaseState.State.ATTACK
	character_animation.play("attack")
	necromancer_drain_area = player_root.get_node("Pivot/NecromancerDrainArea")
	area_indicator = necromancer_drain_area.get_node("Node2D")
	area_indicator.visible = true

func check_and_transition_to_idle() -> bool:
	if !Input.is_action_pressed("mouse_left") && player_root.velocity == Vector2.ZERO:
		area_indicator.visible = false
		state_controller.transition_to_state(BaseState.State.IDLE)
		return true
	return false
func check_and_transition_to_walking() -> bool:
	if !Input.is_action_pressed("mouse_left") && check_movement_inputs():
		area_indicator.visible = false
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
		if object is CharacterBody2D && (object.is_in_group("Enemy") || object.is_in_group("King") || object.is_in_group("Throne")):
			if object in drain_dict:
				drain_dict[object] += 1
				if drain_dict[object] == 100:
					object.take_damage(1)
					drain_dict[object] = 0
			else:
				#var t = tether.instantiate()
				#player_root.get_tree().current_scene.add_child(t)  
				#t.global_position = object.global_position
				#t.fix_tether(player_root)
				drain_dict[object] = 0
	

var radius: float = 50.0
var color: Color = Color.RED
