extends Node



var waves_1 = [
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-250,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-100,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(200,150)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-200,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(200,300)}],
	
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-250,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-100,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(200,150)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-200,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(200,300)}],
	
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-250,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-100,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,150)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(200,150)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-200,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,300)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(200,300)}]
]

var waves_2 = [
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-150,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(150,950)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-100,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(100,1050)}],
	
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-150,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(150,950)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-100,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(100,1050)}],
	
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-150,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(-50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(50,950)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(150,950)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-100,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(0,1050)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(100,1050)}]
	]
var waves_3 = [
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1300)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1400)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1500)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1600)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1350)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1500)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1650)}],
	
	[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1300)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1400)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1500)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1600)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1350)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1500)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1650)}],
	
		[{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1300)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1400)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1500)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(800,1600)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1350)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1500)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(925,1650)}]
	]
var wave_warrior_trial = 	[{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-261,1322)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-261,1357)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-229,1322)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-229,1357)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-197,1322)},
	{"scene": preload("res://scenes/Mage.tscn"), "position": Vector2(-197,1357)}]

var wave_mage_trial = [{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(323,1236)},
	{"scene": preload("res://scenes/Skeleton.tscn"), "position": Vector2(323,1332)}]




var current_wave_1 = 0
var room1_cleared = false
var current_wave_2 = 0
var room2_cleared = false
var current_wave_3 = 0
var room3_cleared = false
var boss_spawned = false

var necromancer_corpse_scene = preload("res://Scenes/necromancer_skeleton.tscn")
var warrior_corpse_scene = preload("res://Scenes/warrior_skeleton.tscn")
var priest_corpse_scene = preload("res://Scenes/priest_skeleton.tscn")
var farmer_corpse_scene = preload("res://Scenes/farmer_skeleton.tscn")

var cracked_egg_scene = preload("res://Scenes/cracked_egg.tscn")
var wing_powerup = preload("res://Scenes/PowerupSpeed.tscn")
var strength_powerup = preload("res://Scenes/PowerupAttack.tscn")

var warrior_trial_spawned = false
var warrior_trial_cleared = false
var warrior_door_opened = false
var mage_trial_spawned = false
var mage_trial_cleared = false
var mage_door_opened = false
var marksman_trial_cleared = false
var demolitionist_trial_cleared = false
var pillar_destroyed = false
var bottom_open

func spawn_wave_1():
	for enemy_data in waves_1[current_wave_1]:
		var enemy = enemy_data["scene"].instantiate()
		enemy.position = enemy_data["position"]
		add_child(enemy)
	current_wave_1 += 1

func spawn_wave_2():
	for enemy_data in waves_2[current_wave_2]:
		var enemy = enemy_data["scene"].instantiate()
		enemy.position = enemy_data["position"]
		add_child(enemy)
	current_wave_2 += 1
func spawn_wave_3():
	for enemy_data in waves_3[current_wave_3]:
		var enemy = enemy_data["scene"].instantiate()
		enemy.position = enemy_data["position"]
		add_child(enemy)
	current_wave_3 += 1
func spawn_warrior_trial_wave():
	for enemy_data in wave_warrior_trial:
		var enemy = enemy_data["scene"].instantiate()
		enemy.position = enemy_data["position"]
		add_child(enemy)
func spawn_mage_trial_wave():
	for enemy_data in wave_mage_trial:
		var enemy = enemy_data["scene"].instantiate()
		enemy.position = enemy_data["position"]
		add_child(enemy)
func spawn_previous_character_corpses():
	var necromancer_corpse = necromancer_corpse_scene.instantiate()
	add_child(necromancer_corpse)
	necromancer_corpse.global_position = Global.necromancer_previous_death
	
	var warrior_corpse = warrior_corpse_scene.instantiate()
	add_child(warrior_corpse)
	warrior_corpse.global_position = Global.warrior_previous_death
	
	var priest_corpse = priest_corpse_scene.instantiate()
	add_child(priest_corpse)
	priest_corpse.global_position = Global.priest_previous_death
	
	var farmer_corpse = farmer_corpse_scene.instantiate()
	add_child(farmer_corpse)
	farmer_corpse.global_position = Global.farmer_previous_death

func spawn_powerups():
	var rng = RandomNumberGenerator.new()
	var powerups = [wing_powerup, strength_powerup]
	for pos in Global.egg_positions:
		print(pos)
		var egg = cracked_egg_scene.instantiate()
		get_tree().current_scene.add_child(egg)
		egg.global_position = pos
		
		var powerup_scene = powerups[rng.randi_range(0, 1)]
		var powerup = powerup_scene.instantiate()
		get_tree().current_scene.add_child(powerup)
		powerup.global_position = pos + Vector2(-2, -8)
	Global.egg_positions = []

func _ready():
	spawn_previous_character_corpses()
	spawn_powerups()
	
	spawn_wave_1()
	$FightSound.play()
	if Global.level == 1:
		await get_tree().create_timer(1.0).timeout
		$Player.show_dialogue("W-Why are we back here again?")
		await get_tree().create_timer(5.0).timeout
		$Player.show_dialogue("There's no way that pile of bones was telling the truth!....right?")
	elif Global.level == 2:
		await get_tree().create_timer(1.0).timeout
		$Player.show_dialogue("Not again! You can't be serious!")
		await get_tree().create_timer(5.0).timeout
		$Player.show_dialogue("I suppose we have to do as he says.. let's look for the relics!")
	elif Global.level == 3:
		await get_tree().create_timer(1.0).timeout
		$Player.show_dialogue("Here we go again...")
		await get_tree().create_timer(5.0).timeout
		$Player.show_dialogue("Hold on, I think I heard something fall!")
	elif Global.level > 3:
		await get_tree().create_timer(1.0).timeout
		$Player.show_dialogue("...")
	if Global.level >=3:
		$Level/SideSecretWalls.visible = true
		$Level/SideSecretFloor.visible = true
func _process(delta: float):
	if $Level/RightDoor2 == null and current_wave_2 == 0:
		spawn_wave_2()
		$IdleSound.stop()
		$FightSound.play()
	if $Level/TopDoor4 == null and current_wave_3 == 0:
		spawn_wave_3()
		$IdleSound.stop()
		$FightSound.play()
	if $Level/TopDoor2 == null and boss_spawned == false:
		if Global.level == 0:
			$Player.show_dialogue("Wow, the boss room already? That was easy!")
	if $Level/LeftDoor8 == null:
		if !warrior_trial_spawned:
			spawn_warrior_trial_wave()
			warrior_trial_spawned = true
		elif get_tree().get_nodes_in_group("Enemy").is_empty():
			warrior_trial_cleared = true
	if warrior_trial_cleared and !warrior_door_opened:
		warrior_door_opened = true
		$Level/LeftDoor12.unlocked = true
	if $Level/LeftDoor2 == null:
		if !mage_trial_spawned:
			spawn_mage_trial_wave()
			mage_trial_spawned = true
		elif get_tree().get_nodes_in_group("Enemy").is_empty():
			mage_trial_cleared = true
	if mage_trial_cleared and !mage_door_opened:
		mage_door_opened = true
		$Level/LeftDoor9.unlocked = true
	if $Level/TrialSwitch.toggled == true and !marksman_trial_cleared:
		marksman_trial_cleared = true
		$Level/TrialWall2.destroy()
		$Level/TrialWall3.destroy()
		$Level/TrialWall4.destroy()
		$Level/TrialWall5.destroy()
		$Level/TrialWall6.destroy()
		$Level/TrialWall7.destroy()
		$Level/TrialWall8.destroy()
		$Level/LeftDoor11.unlocked = true
	pillar_destroyed = $Level/TrialPillar.destroyed or $Level/TrialPillar2.destroyed or $Level/TrialPillar3.destroyed or $Level/TrialPillar4.destroyed or $Level/TrialPillar5.destroyed or $Level/TrialPillar6.destroyed
	if pillar_destroyed and !demolitionist_trial_cleared:
		demolitionist_trial_cleared = true
		$Level/LeftDoor10.unlocked = true
	if current_wave_1 <= 2:
		if get_tree().get_nodes_in_group("Enemy").is_empty():
			spawn_wave_1()
	elif room1_cleared == false and get_tree().get_nodes_in_group("Enemy").is_empty():
		$Level/RightDoor.unlocked = true
		$Level/RightDoor2.unlocked = true
		room1_cleared = true
		if Global.level == 0:
			$Player.show_dialogue("Alright, first room cleared, many to go!")
		$FightSound.stop()
		$IdleSound.play()
	elif current_wave_2 > 0 and current_wave_2 < 3:
		if get_tree().get_nodes_in_group("Enemy").is_empty():
			spawn_wave_2()
	elif current_wave_2 > 2 and room2_cleared == false and get_tree().get_nodes_in_group("Enemy").is_empty():
		$Level/LeftDoor.unlocked = true
		$Level/LeftDoor2.unlocked = true
		$Level/LeftDoor3.unlocked = true
		$Level/LeftDoor4.unlocked = true
		$Level/LeftDoor5.unlocked = true
		$Level/LeftDoor6.unlocked = true
		$Level/LeftDoor7.unlocked = true
		$Level/LeftDoor8.unlocked = true
		$Level/TopDoor.unlocked = true
		$Level/TopDoor4.unlocked = true
		$Level/TopDoor5.unlocked = true
		room2_cleared = true
		$FightSound.stop()
		$IdleSound.play()
	elif current_wave_3 > 0 and current_wave_3 < 3:
		if get_tree().get_nodes_in_group("Enemy").is_empty():
			spawn_wave_3()
	elif current_wave_3 > 2 and room3_cleared == false and get_tree().get_nodes_in_group("Enemy").is_empty():
		$Level/TopDoor2.unlocked = true
		$Level/TopDoor3.unlocked = true
		room3_cleared = true
		$FightSound.stop()
		$IdleSound.play()
	elif $Level/TopDoor2 == null and boss_spawned == false:
		boss_spawned = true
	if mage_trial_cleared and marksman_trial_cleared and warrior_trial_cleared and demolitionist_trial_cleared and !bottom_open:
		bottom_open = true
		$Level/BottomSecretWall.open()
		$Level/BottomSecretWalls.visible = true
		$Level/BottomSecretFloor.visible = true
		
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			toggle_pause()
func toggle_pause():
	get_tree().paused = true
	$PauseMenu.visible = true
