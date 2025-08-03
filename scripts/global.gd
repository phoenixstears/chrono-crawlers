extends Node

var square_relic_acquired: bool = true
var triangle_relic_acquired: bool = false
var circle_relic_acquired: bool = true

var level = 0
var sound_volume = 50
func _ready():
	load_saves()
	load_settings()
	var db = linear_to_db(sound_volume / 100.0)  # Convert 0–100 to decibels
	AudioServer.set_bus_volume_db(0, db)

func load_settings():
	var config = ConfigFile.new()
	var err = config.load("res://data/settings.cfg")
	if err != OK:
		return
	sound_volume = config.get_value("volume","music")

func save_settings():
	var config = ConfigFile.new()
	config.set_value("volume","music",sound_volume)
	config.save("res://data/settings.cfg")



	
func load_saves():
	var config = ConfigFile.new()
	var err = config.load("res://data/saves.cfg")
	if err != OK:
		return
	
	level = config.get_value("game_saves","save_available")
func save_progress(value: int):
	var config = ConfigFile.new()
	config.set_value("game_saves","save_available",value)
	config.save("res://data/saves.cfg")
	
func _exit_tree():
	save_settings()
