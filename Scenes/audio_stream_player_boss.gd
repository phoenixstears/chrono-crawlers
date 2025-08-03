extends AudioStreamPlayer
# Assuming you have an AudioStreamPlayer node called "MusicPlayer"

func _ready():
	volume_db = -80  # Start silent (in decibels)
	play()

	# Create a Tween and animate the volume to 0 dB (normal volume)
	var tween = create_tween()
	tween.tween_property(self, "volume_db", 0, 1.0)  # Fade in over 3 seconds
