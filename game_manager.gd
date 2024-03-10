extends Node


@onready var player = get_tree().get_nodes_in_group("PlayerGroup")[0]
@onready var player_coordinates = get_tree().get_nodes_in_group("PlayerGroup")[0].global_position

var player_death_location:Vector2

signal game_over


var enemy_count: int
var score: int = 0

#timer stuff
signal timeout

const ENEMY_UPDATE_TIME_PERIOD = 0.3
var enemy_update_time = 0

func _ready():
	self.connect("timeout",update_enemies)

func _process(delta):
	update_enemy_timer(delta)
	
	

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

