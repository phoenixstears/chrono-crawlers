extends Area2D


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		MusicPlayer.playPowerup()
		body.powerup_speed += 25
		queue_free()
