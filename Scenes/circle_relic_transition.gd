extends TextureRect

var broken_circle = preload("res://sprites/Relics/broken_circle.png")

var target_position: Vector2
var speed: float = 600.0  # pixels per second

func _ready():
	target_position = Vector2(772, 461)  # Set your target point
	$"../FadeinWhite".modulate.a = 0
	$"../FadeinBlack".modulate.a = 0
	
func _physics_process(delta):
	if Global.circle_relic_acquired:
		position = position.move_toward(target_position, speed * delta)
	if position == target_position && !(Global.square_relic_acquired && Global.circle_relic_acquired && Global.triangle_relic_acquired):
		texture = broken_circle
		$"../FadeinBlack".modulate = $"../FadeinBlack".modulate.lerp(Color(1, 1, 1, 1), delta)
	elif position == target_position && (Global.square_relic_acquired && Global.circle_relic_acquired && Global.triangle_relic_acquired):
		print("whitening")
		$"../FadeinWhite".modulate = $"../FadeinWhite".modulate.lerp(Color(1, 1, 1, 1), delta)
	if $"../FadeinWhite".modulate.a > 0.99:
		print("loading ending scene")
		get_tree().change_scene_to_file("res://Scenes/ending.tscn")
	if $"../FadeinBlack".modulate.a > 0.99:
		print("loading level scene")
		get_tree().change_scene_to_file("res://Scenes/level_transition_screen.tscn")
