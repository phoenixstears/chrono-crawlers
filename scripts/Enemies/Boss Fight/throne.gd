extends StaticBody2D

@onready var animation = $AnimatedSprite2D
var king = preload("res://Scenes/King.tscn")

var activated = false

func take_damage(_dmg):
	if !activated:
		$Timer.start()
		activated = true
		print("1")

func _on_timer_timeout() -> void:
	if activated:
		print(animation.animation)
		animation.play("default")


func _on_animated_sprite_2d_animation_finished() -> void:
	if activated:
		print("Boss fight start")
		animation.play("empty_throne")
		var king_node = king.instantiate()
		get_tree().current_scene.add_child(king_node)   
		king_node.global_position = $KingSpawn.global_position
