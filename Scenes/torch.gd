extends Area2D

@export var out = false

func toggle():
	if not out:
		$Sprite.play("put_out")
		out = true
	else:
		$Sprite.play("lit")
		out = false
