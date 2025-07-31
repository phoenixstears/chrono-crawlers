extends CharacterBody2D

@onready var necromancer = $"Characters/Necromancer"
@onready var farmer = $"Characters/Farmer"
@onready var priest = $"Characters/Priest"
@onready var warrior = $"Characters/Warrior"
@onready var queue_positions = [necromancer, farmer, priest, warrior]

const unselected_alpha = 0.2

const speed = 100
const frame_distance = 20
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

func _process(delta: float) -> void:
	#if Input.is_action_just_pressed("1"):
	if Input.is_action_just_pressed("2"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(1)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 1
	if Input.is_action_just_pressed("3"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(2)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 2
	if Input.is_action_just_pressed("4"):
		queue_positions[0].modulate.a = unselected_alpha
		swap_character(3)
		queue_positions[0].modulate.a = 1.0
		swapping_idx = 3

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
		
