extends Node


func stop_music():
	$AudioStreamPlayer.stop()
	
func play_music():
	$AudioStreamPlayer.play()

func playDoorOpen():
	$DoorOpen.play()

func playPowerup():
	$Powerup.play()
