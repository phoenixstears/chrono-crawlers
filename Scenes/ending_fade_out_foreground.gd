extends ColorRect

var target_color: Color = Color(1, 1, 1, 0)
var speed: float = 0.5

func _process(delta):
	color = color.lerp(target_color, delta * speed)
