extends CPUParticles2D

func fix_tether(player):
	look_at(player.global_position)
	var distance = (player.global_position - global_position).length()
	lifetime = distance/initial_velocity_max
