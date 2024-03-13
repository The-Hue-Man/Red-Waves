extends Camera2D





func _ready():
	
	GameManager.connect("game_over",set_final_position)
	if get_tree().get_nodes_in_group("player").size() > 0:
		reparent(get_tree().get_nodes_in_group("player")[0])





func set_final_position():
	var old_global_pos = global_position
	reparent(get_parent().get_parent())
	global_position = old_global_pos
