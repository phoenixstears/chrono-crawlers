extends StaticBody2D

@export var destroyed = false

func destroy():
	$Sprite.play("down")
	destroyed = true
	$Collider.disabled = true
