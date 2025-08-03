extends TextureRect

var broken_square = preload("res://sprites/Relics/broken_square.png")

var target_position: Vector2
var speed: float = 600.0  # pixels per second

func _ready():
	target_position = Vector2(772, 307)  # Set your target point

func _process(delta):
	if Global.square_relic_acquired:
		position = position.move_toward(target_position, speed * delta)
	if position == target_position && !(Global.square_relic_acquired && Global.circle_relic_acquired && Global.triangle_relic_acquired):
		texture = broken_square
