extends HSlider


func _on_value_changed(value: float) -> void:
	Global.sound_volume = value
	var db = linear_to_db(value / 100.0)  # Convert 0–100 to decibels
	AudioServer.set_bus_volume_db(0, db)
