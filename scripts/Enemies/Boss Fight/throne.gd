extends StaticBody2D

@onready var animation = $AnimatedSprite2D
var king = preload("res://Scenes/King.tscn")

var activated = false

func _process(delta: float) -> void:
	if animation.animation == "default" && animation.frame == 11:
		$KingLaugh.play(0.4)

func take_damage(_dmg):
	if !activated:
		$Timer.start()
		activated = true

func _on_timer_timeout() -> void:
	if activated:
		animation.play("default")


func _on_animated_sprite_2d_animation_finished() -> void:
	if activated:
		animation.play("empty_throne")
		var king_node = king.instantiate()
		get_tree().current_scene.add_child(king_node)   
		king_node.global_position = $KingSpawn.global_position
