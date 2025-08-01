extends Area2D

var player_on = false

func _ready():
	$Timer.start(1.0)
	
func _process(delta: float):
	if player_on:
		if $Sprite.animation == "up":
			if $Sprite.frame > 2 and $Sprite.frame < 7:
				get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_on = true
		if $Sprite.animation == "up":
			if $Sprite.frame > 2 and $Sprite.frame < 7:
				get_tree().change_scene_to_file("res://Scenes/MainMenu.tscn")



func _on_timer_timeout() -> void:
	$Sprite.play("up")
	await $Sprite.animation_finished
	$Timer.start(1.0)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_on = false
