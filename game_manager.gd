extends Node

@onready var player = get_tree().get_nodes_in_group("PlayerGroup")[0]

@onready var player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position

func game_over():
	get_tree().reload_scene()


func is_player_alive() -> bool:
	if get_tree().get_nodes_in_group("PlayerGroup").size() > 0:
		return true
	else:
		return false


func get_player_global_position() -> Vector2:
	if get_tree().get_nodes_in_group("PlayerGroup").size() > 0:
		player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position
	return player_coordinates
