extends Path2D

@onready var enemy_spawn_location = %EnemySpawnLocation
@export var tile_map: TileMap

@export var enemies_spawned: Array[PackedScene]




func _on_spawn_timer_timeout():
	spawn_enemies()


func spawn_enemy_set_random_location(new_enemy):
	enemy_spawn_location.progress_ratio = randf()
	var random_position_modifer: Vector2 = Vector2(randi_range(-12,21),randi_range(-15,20))
	new_enemy.global_position = enemy_spawn_location.global_position + random_position_modifer
	
	#get the tile the enemy is standing on
	var new_enemy_tile_position = tile_map.get_cell_atlas_coords(0,tile_map.local_to_map(new_enemy.position))
	
	
	#check if the tile is one of the full ground tiles
	if  new_enemy_tile_position == Vector2i(1,1) || new_enemy_tile_position == Vector2i(4,1):
		pass
	else:
		spawn_enemy_set_random_location(new_enemy)


func spawn_enemies():
	for enemy in enemies_spawned:
		
		var new_enemy = enemy.instantiate()
		
		spawn_enemy_set_random_location(new_enemy)
		
		get_tree().get_current_scene().add_child(new_enemy)
	
