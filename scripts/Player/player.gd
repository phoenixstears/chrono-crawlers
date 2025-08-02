extends CharacterBody2D

@onready var necromancer = $"Characters/Necromancer"
@onready var farmer = $"Characters/Farmer"
@onready var priest = $"Characters/Priest"
@onready var warrior = $"Characters/Warrior"
@onready var queue_positions = [necromancer, farmer, priest, warrior]

var state_controller = StateController.new()

const unselected_alpha = 0.2

const speed = 100
const frame_distance = 12
var positions_buffer = []

var swapping_idx = -1
var swap_progress = 0.0
const swap_speed = 0.08

func _ready() -> void:
	positions_buffer.resize(frame_distance*queue_positions.size())
	for i in range(positions_buffer.size()):
		positions_buffer[i] = Vector2.ZERO
	for i in range(queue_positions.size()):
		queue_positions[i].position = positions_buffer[i]
		if i == 0:
			queue_positions[i].modulate.a = 1.0
		else:
			queue_positions[i].modulate.a = 0.2
	state_controller.ready(self)
	state_controller.swap_character(queue_positions[0])
	state_controller.transition_to_state(BaseState.State.IDLE)

func _process(delta: float) -> void:
	
	state_controller.process(delta)
	#if Input.is_action_just_pressed("1"):
	if Input.is_action_just_pressed("2"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(1)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 1
		state_controller.swap_character(queue_positions[0])
		state_controller.transition_to_state(BaseState.State.IDLE)
	if Input.is_action_just_pressed("3"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(2)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 2
		state_controller.swap_character(queue_positions[0])
		state_controller.transition_to_state(BaseState.State.IDLE)
	if Input.is_action_just_pressed("4"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(3)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 3
		state_controller.swap_character(queue_positions[0])
		state_controller.transition_to_state(BaseState.State.IDLE)
	if Input.is_action_just_pressed("interact"):
		var torch = check_if_torch_close()
		if torch != null:
			torch.toggle()
		var door = check_if_door_close()
		if door != null:
			door.open()

func check_if_torch_close():
	for body in get_tree().get_nodes_in_group("Torch"):
		if global_position.distance_to(body.global_position) < 12:
			return body
	return null
	
func check_if_door_close():
	for body in get_tree().get_nodes_in_group("Door"):
		if global_position.distance_to(body.global_position) < 12:
			return body
	return null


func _physics_process(delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_pressed("up"):
		direction += Vector2.UP
	if Input.is_action_pressed("down"):
		direction += Vector2.DOWN
	if Input.is_action_pressed("left"):
		direction += Vector2.LEFT
	if Input.is_action_pressed("right"):
		direction += Vector2.RIGHT
	velocity = direction.normalized() * speed
	
	move_and_slide()
	
	if direction != Vector2.ZERO:
		for i in range(positions_buffer.size() - 1, -1, -1):
			if(i != 0):
				positions_buffer[i] = positions_buffer[i-1]
			else:
				positions_buffer[i] = position
	if swap_progress < 1 && swapping_idx > -1:
		swap_progress += swap_speed
	else:
		swap_progress = 0
		swapping_idx = -1
	if swapping_idx < 0:
		for i in range(queue_positions.size()):
			queue_positions[i].position = positions_buffer[i*frame_distance]
	else:
		for i in range(queue_positions.size()):
			if i == 0:
				queue_positions[i].position = lerp(positions_buffer[swapping_idx*frame_distance], positions_buffer[i*frame_distance], swap_progress)
			elif i == swapping_idx:
				queue_positions[i].position = lerp(positions_buffer[0*frame_distance], positions_buffer[swapping_idx*frame_distance], swap_progress)
			else: 
				queue_positions[i].position = positions_buffer[i*frame_distance]
func swap_character(idx: int) -> void:
	var temp = queue_positions[0]
	queue_positions[0] = queue_positions[idx]
	queue_positions[idx] = temp
		
func take_damage():
	if queue_positions.size() == 1:
		get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")
	else:
		state_controller.transition_to_state(BaseState.State.DEAD)
		queue_positions.remove_at(0)
		state_controller.swap_character(queue_positions[0])
