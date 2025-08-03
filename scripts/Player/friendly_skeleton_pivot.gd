extends Area2D

var parent

func _ready() -> void:
	parent = get_parent()

func _process(delta: float) -> void:
	if  parent != null and !parent.attacking:
		look_at(get_global_mouse_position())
