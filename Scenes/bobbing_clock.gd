extends AnimatedSprite2D

var top
var mid
var bot
var range = 25

var acc = 0
var reduction_speed = 0.1
var speed_acc = 1.5

func _ready() -> void:
	mid = position
	top = mid + Vector2(0, range)
	bot = mid + Vector2(0, -range)
	modulate.a = 0
	
func _process(delta: float) -> void:

	acc += delta
	speed_acc -= delta*reduction_speed
	if speed_acc < -1:
		speed_acc = -1
	#var scaled_range = range+speed_acc
	#top = mid + Vector2(0, scaled_range)
	#bot = mid + Vector2(0, -scaled_range)
	
	modulate = modulate.lerp(Color(1, 1, 1, 1), delta)
	position = bot.lerp(top, sin(acc))*abs(speed_acc)
	speed_scale = speed_acc
