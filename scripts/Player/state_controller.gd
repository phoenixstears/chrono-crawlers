class_name StateController
extends Node

var current_character_animation_object
var states = [BaseState.new(), BaseState.new(), BaseState.new(), BaseState.new(), BaseState.new()]
var current_state = BaseState.new()

var player_root
func ready(player_root) -> void:
	self.player_root = player_root

func process(delta: float) -> void:
	current_state.check_and_transition_to_idle()
	current_state.check_and_transition_to_walking()
	current_state.check_and_transition_to_attack()
	current_state.check_and_transition_to_dead()
	current_state.check_and_transition_to_ability()
	current_state.process_state(delta)

func swap_character(character):
	player_root.get_node("Pivot/NecromancerDrainArea/Node2D").visible = false
	player_root.get_node("Pivot/WarriorSwingAnimation").visible = false
	current_character_animation_object = character
	if character.name == "Priest":
		states[0] = PriestIdleState.new()
		states[1] = PriestWalkingState.new()
		states[2] = PriestAttackState.new()
		states[3] = PriestDeadState.new()
		states[4] = PriestAbilityState.new()
		for state in states:
			state.init(current_character_animation_object, self, player_root)
		current_state = states[0]
		current_state.enter_state()
	elif character.name == "Necromancer":
		states[0] = NecromancerIdleState.new()
		states[1] = NecromancerWalkingState.new()
		states[2] = NecromancerAttackState.new()
		states[3] = NecromancerDeadState.new()
		states[4] = NecromancerAbilityState.new()
		for state in states:
			state.init(current_character_animation_object, self, player_root)
		current_state = states[0]
		current_state.enter_state()
	elif character.name == "Farmer":
		states[0] = FarmerIdleState.new()
		states[1] = FarmerWalkingState.new()
		states[2] = FarmerAttackState.new()
		states[3] = FarmerDeadState.new()
		states[4] = FarmerAbilityState.new()
		for state in states:
			state.init(current_character_animation_object, self, player_root)
		current_state = states[0]
		current_state.enter_state()
	elif character.name == "Warrior":
		states[0] = WarriorIdleState.new()
		states[1] = WarriorWalkingState.new()
		states[2] = WarriorAttackState.new()
		states[3] = WarriorDeadState.new()
		states[4] = WarriorAbilityState.new()
		for state in states:
			state.init(current_character_animation_object, self, player_root)
		current_state = states[0]
		current_state.enter_state()

func transition_to_state(state):
	if state == BaseState.State.IDLE:
		current_state = states[0]
		current_state.enter_state()
	elif state == BaseState.State.WALKING:
		current_state = states[1]
		current_state.enter_state()
	elif state == BaseState.State.ATTACK:
		current_state = states[2]
		current_state.enter_state()
	elif state == BaseState.State.DEAD:
		current_state = states[3]
		current_state.enter_state()
	elif state == BaseState.State.ABILITY:
		current_state = states[4]
		current_state.enter_state()
