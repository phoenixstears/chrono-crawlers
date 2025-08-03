extends StaticBody2D

@export var unlocked = false

func open():
	MusicPlayer.playDoorOpen()
	queue_free()
