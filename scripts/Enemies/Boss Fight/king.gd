extends CharacterBody2D

@onready var animation = $AnimatedSprite2D
@onready var player = $"../Player"
@onready var slash_particle_animation = $SlashArea/AnimatedSprite2D
@onready var slash_area = $SlashArea
@onready var summon_particles = $CPUParticles2D

@export var bullet_scene = preload("res://Scenes/Bullet.tscn")
@onready var bullet_spawn = $BulletSpawnPoint

var mage_spawn_scene = preload("res://Scenes/mage_spawn.tscn")
var skeleton_spawn_scene = preload("res://Scenes/skeleton_spawn.tscn")

var rng = RandomNumberGenerator.new()

enum States {WALKING, PROJECTILE, SLASHING, SUMMONING}
var current_state = States.WALKING
var current_state_idx = 0
const base_speed = 80
var states_list = [States.PROJECTILE, States.SUMMONING, States.SLASHING]

# Slash related stuff
const dashing_speed = 130
const slashing_distance = 10
@export var slashing_currently = false
var can_hit_player = false

# Projectile attack
var shooting_waves = false
var shooting_projectiles_currently = false
var projectile_waves = [projectile_wave_spiral, projectile_wave_targeted, projectile_wave_circle]
var current_wave_idx = 0

# Summon attack
var summoning = false
var currently_summoning = false
const mage_spawn_count = 4
const skeleton_spawn_count = 4
var min_dist_from_player = 50
var max_dist_from_player = 100

const max_hp = 40
var current_hp = 40
var dead = false

func _ready() -> void:
	slash_particle_animation.visible = false


func _process(delta: float) -> void:
	if dead:
		return
	if current_state == States.WALKING:
		change_state()
	elif current_state == States.PROJECTILE:
		shoot_projectiles()
	elif current_state == States.SLASHING:
		slashing()
	elif current_state == States.SUMMONING:
		summon()
	move_and_slide()
	if velocity.x < 0:
		animation.flip_h = true
	else:
		animation.flip_h = false

func slashing():
	var distance = position.distance_to(player.position)
	if !slashing_currently:
		if distance > slashing_distance:
			if !animation.animation == "walk":
				animation.play("walk")
			velocity = (player.position - position).normalized()*dashing_speed
		else:
			velocity = Vector2.ZERO
			if !slashing_currently:
				animation.play("slash")
				slashing_currently = true
				can_hit_player = true
	else:
		if animation.frame == 6 && !slash_particle_animation.visible:
			slash_particle_animation.visible = true
			slash_particle_animation.play("default")
		
		if slash_particle_animation.frame == 2:
			slash_particle_animation.visible = false
			
		if animation.frame == 6 || animation.frame == 7:
			for object in slash_area.get_overlapping_bodies():
				if object.is_in_group("Player") and can_hit_player:
					object.take_damage()
					can_hit_player = false
		elif animation.frame == 17:
			slashing_currently = false
			change_state()

func shoot_projectiles():
	if !shooting_waves:
		animation.play("projectile_initial")
		shooting_waves = true
	else:
		var shooting_frame = 8
		if animation.animation == "projectile_initial":
			shooting_frame = 7
		if animation.frame == 0:
			shooting_projectiles_currently = false
		if animation.frame == shooting_frame && !shooting_projectiles_currently:
			current_wave_idx += 1
			if current_wave_idx >= projectile_waves.size():
				shooting_projectiles_currently = false
				shooting_waves = false
				current_wave_idx = 0
				change_state()
			shooting_projectiles_currently = true
			projectile_waves[current_wave_idx].call()
			if !animation.animation == "projectile_repeat":
				animation.play("projectile_repeat")

func projectile_wave_circle():
	var projectile_count = 20
	var bullet_speed = 40
	var angle = 2*PI/projectile_count
	for i in range(projectile_count):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)  
		bullet.global_position = bullet_spawn.global_position
		var direction = Vector2.RIGHT.rotated(angle*i).normalized()
		bullet.velocity = direction * bullet_speed

func projectile_wave_targeted():
	var projectile_count = 10
	var bullet_speed_min = 40
	var bullet_speed_max = 80
	for i in range(projectile_count):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)  
		bullet.global_position = bullet_spawn.global_position
		var direction = (player.position - position).normalized()
		bullet.velocity = direction * (bullet_speed_min + (bullet_speed_max - bullet_speed_min)*i/projectile_count)
	
func projectile_wave_spiral():
	var projectile_count = 150
	var bullet_speed_min = 5
	var bullet_speed_max = 60
	var rotations = 8
	var angle = 2*PI*rotations/projectile_count
	for i in range(projectile_count):
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)  
		bullet.global_position = bullet_spawn.global_position
		var direction = Vector2.RIGHT.rotated(angle*i).normalized()
		bullet.velocity = direction * (bullet_speed_min + (bullet_speed_max - bullet_speed_min)*i/projectile_count)
		
func summon():
	if !summoning:
		animation.play("summon")
		summoning = true
	else:
		if animation.frame == 6 && !currently_summoning:
			currently_summoning = true
			summon_particles.restart()
			summon_particles.emitting = true
			
			for i in range(skeleton_spawn_count):
				var spawn_position = player.global_position + (Vector2.RIGHT*(min_dist_from_player + (max_dist_from_player - min_dist_from_player)*randf())).rotated(randf()*2*PI)
				var skeleton_spawn = skeleton_spawn_scene.instantiate()
				get_parent().add_child(skeleton_spawn)
				skeleton_spawn.global_position = spawn_position
				skeleton_spawn.init_spawn(global_position.distance_to(spawn_position)/summon_particles.initial_velocity_min)
		
		if animation.frame == 13:
			summoning = false
			currently_summoning = false
			change_state()

func change_state():
	current_state_idx += 1
	current_state = get_circular(states_list, current_state_idx)
	
func get_circular(arr: Array, index: int) -> Variant:
	var n = arr.size()
	return arr[(index % n + n) % n]

func take_damage(dmg):
	current_hp -= dmg
	if current_hp < 0:
		dead = true
		set_process(false)
		set_physics_process(false)
		animation.play("dead")
	
