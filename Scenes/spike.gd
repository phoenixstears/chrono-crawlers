extends Area2D

var player_on = false
var can_be_damaged = false

func _ready():
	$Timer.start(1.0)
	
func _process(delta: float):
	if player_on:
		if $Sprite.animation == "up":
			if $Sprite.frame > 2 and $Sprite.frame < 7 && can_be_damaged:
				get_tree().root.get_node("Level1/Player").take_damage()
				can_be_damaged = false
		if $Sprite.frame == 9:
			can_be_damaged = true

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_on = true
		can_be_damaged = true
		if $Sprite.animation == "up":
			if $Sprite.frame > 2 and $Sprite.frame < 7 && can_be_damaged:
				get_tree().root.get_node("Level1/Player").take_damage()
				can_be_damaged = false



func _on_timer_timeout() -> void:
	$Sprite.play("up")
	await $Sprite.animation_finished
	$Timer.start(1.0)


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		player_on = false
