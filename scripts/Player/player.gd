extends CharacterBody2D

@onready var necromancer = $"Characters/Necromancer"
@onready var farmer = $"Characters/Farmer"
@onready var priest = $"Characters/Priest"
@onready var warrior = $"Characters/Warrior"
@onready var queue_positions = [necromancer, farmer, priest, warrior]
var saw_pillar = false
var state_controller = StateController.new()

var warrior_stats = {
	"damage": 2,
	"attack_speed": 1.0
}

var priest_unlocks = {
	"necromancer": false,
	"warrior": false,
	"priest": false,
	"farmer": false
}

var necromancer_summons = {
	"FriendlySkeleton1" = false,
	"FriendlySkeleton2" = false,
	"FriendlySkeleton3" = false,
	"FriendlySkeleton4" = false
}

const unselected_alpha = 0.2

const speed = 100
var powerup_speed = 0

var powerup_damage = 0

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
		if door != null and door.unlocked:
			door.open()
		var chest = check_if_chest_close()
		if chest != null:
			chest.open()
			if Global.level == 2:
				await get_tree().create_timer(0.5).timeout
				show_dialogue("The torches in this dungeon are set up really weirdly..")
				await get_tree().create_timer(5.0).timeout
				show_dialogue("523423...hm...")
		var king = check_if_dead_king_close()
		if king != null:
			for character in queue_positions:
				if character.name == "necromancer":
					Global.necromancer_previous_death = Vector2(-1000, -1000)
				elif character.name == "warrior":
					Global.warrior_previous_death = Vector2(-1000,-1000)
				elif character.name == "priest":
					Global.warrior_previous_death = Vector2(-1000,-1000)
				elif character.name == "farmer":
					Global.warrior_previous_death = Vector2(-1000,-1000)
				
			get_tree().change_scene_to_file("res://Scenes/transition_scene.tscn")
	if get_tree() != null:
		check_for_pillar()
	if get_tree() != null:
		check_for_relics()

func check_for_relics():
	for body in get_tree().get_nodes_in_group("OrangeRelic"):
		if global_position.distance_to(body.global_position) < 12:
			body.queue_free()
			Global.square_relic_acquired = true
			MusicPlayer.playRelic()
	for body in get_tree().get_nodes_in_group("GreenRelic"):
		if global_position.distance_to(body.global_position) < 12:
			body.queue_free()
			Global.triangle_relic_acquired = true
			MusicPlayer.playRelic()
	for body in get_tree().get_nodes_in_group("BlueRelic"):
		if global_position.distance_to(body.global_position) < 12:
			body.queue_free()
			Global.circle_relic_acquired = true
			MusicPlayer.playRelic()
func check_if_chest_close():
	for body in get_tree().get_nodes_in_group("Chest"):
		if global_position.distance_to(body.global_position) < 20:
			return body
	return null

func check_for_pillar():
	if !saw_pillar and Global.level > 0 and Global.level < 3:
		for body in get_tree().get_nodes_in_group("Pillar"):
			if global_position.distance_to(body.global_position) < 50:
				saw_pillar = true
				show_dialogue("This Pillar looks damaged..")
				await get_tree().create_timer(5.0).timeout
				show_dialogue("Maybe it'll eventually give in to time!")
	
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
	
func check_if_dead_king_close():
	for body in get_tree().get_nodes_in_group("King"):
		if global_position.distance_to(body.global_position) < 12 && body.dead == true:
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
	velocity = direction.normalized() * (speed + powerup_speed)
	
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
	if idx >= queue_positions.size():
		idx = queue_positions.size() - 1
	var temp = queue_positions[0]
	queue_positions[0] = queue_positions[idx]
	queue_positions[idx] = temp
		
func take_damage():
	$CharDeathSFX.play()
	state_controller.transition_to_state(BaseState.State.DEAD)
	if queue_positions[0].name == "Necromancer":
		Global.necromancer_previous_death = global_position
	elif queue_positions[0].name == "Warrior":
		Global.warrior_previous_death = global_position
	elif queue_positions[0].name == "Priest":
		Global.priest_previous_death = global_position
	elif queue_positions[0].name == "Farmer":
		Global.farmer_previous_death = global_position
	queue_positions.remove_at(0)
	if queue_positions.size() > 0:
		state_controller.swap_character(queue_positions[0])
		queue_positions[0].modulate.a = 1.0
	else:
		call_deferred("change_scene_safely")

func change_scene_safely():
	get_tree().change_scene_to_file("res://Scenes/GameOverScreen.tscn")

		
func show_dialogue(message: String):
	$DialogueBox.text = message
	$DialogueBox.visible = true
	await get_tree().create_timer(4.0).timeout
	$DialogueBox.visible = false
	
