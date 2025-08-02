extends StaticBody2D


func _ready():
	match Global.level:
		0:
			$Sprite.play("iter1")
		1:
			$Sprite.play("iter2")
		2:
			$Sprite.play("iter3")
		_:
			$Collider.position.x -= 24
			$Collider.position.y -= 6
			position.x += 27
			position.y += 5
			$Sprite.play("iter4")
