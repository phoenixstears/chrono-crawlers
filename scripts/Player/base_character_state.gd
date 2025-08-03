class_name BaseState
extends CharacterBody2D

var player_root

enum State {UNDEFINED, IDLE, WALKING, ATTACK, DEAD, ABILITY}
var character_animation
var state_controller: StateController
var state_type

func init(character_animation, state_controller, player_root):
	self.character_animation = character_animation
	self.state_controller = state_controller
	self.player_root = player_root

func enter_state() -> void:
		print("Unimplemented enter_state")

func check_and_transition_to_idle() -> bool:
	print("Unimplemented check_and_transition_to_idle")
	return false
func check_and_transition_to_walking() -> bool:
	if check_movement_inputs():
		state_controller.transition_to_state(State.WALKING) 
		return true
	return false
func check_and_transition_to_attack() -> bool:
	if Input.is_action_just_pressed("mouse_left"):
		state_controller.transition_to_state(BaseState.State.ATTACK)
		return true
	return false
func check_and_transition_to_dead() -> bool:
	return false
func check_and_transition_to_ability() -> bool:
	if Input.is_action_just_pressed("mouse_right"):
		state_controller.transition_to_state(BaseState.State.ABILITY)
		return true
	return false
func check_movement_inputs() -> bool:
	return Input.is_action_pressed("left") || Input.is_action_pressed("right") || Input.is_action_pressed("up") || Input.is_action_pressed("down")

func process_state(delta: float) -> void:
	if Input.is_action_just_pressed("left") && !character_animation.flip_h:
		character_animation.flip_h = true
	if Input.is_action_just_pressed("right") && character_animation.flip_h:
		character_animation.flip_h = false
