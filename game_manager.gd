extends Node

@onready var player = get_tree().get_nodes_in_group("PlayerGroup")[0]

@onready var player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position



func get_player_global_position() -> Vector2:
	player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position
	return player_coordinates
