extends Node2D

@export var radius: float = 40.0
@export var color: Color = Color("5e8c51")

func _ready():
	queue_redraw() # Triggers a redraw

func _draw():
	draw_circle(Vector2.ZERO, radius, color)
