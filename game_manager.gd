extends Node


@onready var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
@onready var player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position


signal player_levelled_up

var player_death_location:Vector2

signal game_over


var enemy_count: int
var score: int = 0

#timer stuff
signal timeout
signal enemy_death

const ENEMY_UPDATE_TIME_PERIOD = 0.3
var enemy_update_time = 0

func _ready():
	self.connect("timeout",update_enemies)

func _process(delta):
	update_enemy_timer(delta)
	

func on_enemy_death(death_position : Vector2):
	enemy_count -= 1
	emit_signal("enemy_death", death_position)

func update_enemy_timer(delta):
	enemy_update_time += delta
	if enemy_update_time > ENEMY_UPDATE_TIME_PERIOD:
		emit_signal("timeout")
		# Reset timer
		enemy_update_time = 0

func update_enemies():
	get_tree().call_group("enemy","target_player")


func is_player_alive() -> bool:
	if get_tree().get_nodes_in_group("PlayerGroup").size() > 0:
		return true
	else:
		return false


func get_player_global_position() -> Vector2:
	if is_player_alive():
		player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position
		
	return player_coordinates



func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_ESCAPE:
			get_tree().quit()
		else:
			if event.is_action_pressed("decrease_volume"):
				AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),AudioServer.get_bus_volume_db(1) - .32)
				AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),AudioServer.get_bus_volume_db(1) - .32)
				AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SoundEffects"),AudioServer.get_bus_volume_db(1) - .32)
			else:
				if event.is_action_pressed("increase_volume"):
					AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"),AudioServer.get_bus_volume_db(1) + .32)
					AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"),AudioServer.get_bus_volume_db(1) + .32)
					AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SoundEffects"),AudioServer.get_bus_volume_db(1) + .32)
				else:
					if event.is_action_pressed("mute_music"):
						if AudioServer.get_bus_volume_db(1) == -80.0:
							AudioServer.set_bus_volume_db(1,-5.5)
						else:
							AudioServer.set_bus_volume_db(1,-80.0)
					else:
						if event.is_action_pressed("mute_sound"):
							if AudioServer.get_bus_volume_db(2) == -80.0:
								AudioServer.set_bus_volume_db(2,0)
							else:
								AudioServer.set_bus_volume_db(2,-80.0)
