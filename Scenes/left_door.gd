extends StaticBody2D

@export var unlocked = false

func open():
	queue_free()
