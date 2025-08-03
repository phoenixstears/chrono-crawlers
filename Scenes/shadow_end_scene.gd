extends TextureRect

func _ready() -> void:
	modulate.a = 0

func _process(delta: float) -> void:
	modulate = modulate.lerp(Color(1, 1, 1, 1), delta)
