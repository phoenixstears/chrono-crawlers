extends Label

var scroll_speed = 20

func _process(delta: float) -> void:
	if $"../Clock".speed_acc < -0.7:
		print("1")
		position.y -= delta * scroll_speed
