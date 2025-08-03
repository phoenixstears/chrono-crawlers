extends TextureRect

var broken_circle = preload("res://sprites/Relics/broken_circle.png")

var target_position: Vector2
var speed: float = 600.0  # pixels per second
var timing = false
var fade_black = false

func _ready():
	target_position = Vector2(772, 461)  # Set your target point
	$"../FadeinWhite".modulate.a = 0
	$"../FadeinBlack".modulate.a = 0
	
func _process(delta):
	if Global.circle_relic_acquired:
		position = position.move_toward(target_position, speed * delta)
	else:
		if !timing:
			timing = true
			await get_tree().create_timer(4).timeout
			fade_black = true
	if fade_black || (position == target_position && !(Global.square_relic_acquired && Global.circle_relic_acquired && Global.triangle_relic_acquired)):
		texture = broken_circle
		$"../FadeinBlack".modulate = $"../FadeinBlack".modulate.lerp(Color(1, 1, 1, 1), delta)
	elif (position == target_position && (Global.square_relic_acquired && Global.circle_relic_acquired && Global.triangle_relic_acquired)): 
		$"../FadeinWhite".modulate = $"../FadeinWhite".modulate.lerp(Color(1, 1, 1, 1), delta)
	if $"../FadeinWhite".modulate.a > 0.99:
		get_tree().change_scene_to_file("res://Scenes/ending.tscn")
	if $"../FadeinBlack".modulate.a > 0.99:
		get_tree().change_scene_to_file("res://Scenes/level_transition_screen.tscn")
