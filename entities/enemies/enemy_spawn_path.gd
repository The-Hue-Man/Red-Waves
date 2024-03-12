extends Path2D

@onready var spawn_timer = %SpawnTimer

@onready var enemy_spawn_location = %EnemySpawnLocation
@export var tile_map: TileMap

@export var enemies_spawned: Array[PackedScene]

@export var small_slime_scene : PackedScene
@export var big_slime_scene : PackedScene

#This is some bullshit

var time_since_game_start = 0.0

var current_spawn_level = 1

var prev_spawn_time = 0

var spawn_dict = {
	"1" : {
		"spawn_rate"  : 1.5,
		"small_slimes" : 3,
		"big_slimes" : 0
	},
	
	"2" : {
		"spawn_rate"  : 1.5,
		"small_slimes" : 2,
		"big_slimes" : 1
	},
	
	"3" : {
		"spawn_rate"  : 1.6,
		"small_slimes" : 3,
		"big_slimes" : 1
	},
	
	"4" : {
		"spawn_rate"  : 1.6,
		"small_slimes" : 3,
		"big_slimes" : 2
	},
	
}

func _ready():
	set_spawn_rules(current_spawn_level)


func _process(delta: float) -> void:
	
	time_since_game_start += delta
	
	if time_since_game_start > prev_spawn_time + 5:
		prev_spawn_time = time_since_game_start
		current_spawn_level += 1
		set_spawn_rules(current_spawn_level)

func set_spawn_rules(spawn_level):
	if spawn_dict.size() < spawn_level:
		return
		
	spawn_timer.set_wait_time(spawn_dict.get(str(spawn_level)).get("spawn_rate"))
	
	enemies_spawned.clear()
	
	
	
	var small_slime_amount = spawn_dict.get(str(spawn_level)).get("small_slimes")
	var big_slime_amount = spawn_dict.get(str(spawn_level)).get("big_slimes")
	
	
	for i in range(small_slime_amount):
		enemies_spawned.append(small_slime_scene)
	
	for i in range(big_slime_amount):
		enemies_spawned.append(big_slime_scene)


var ready_to_spawn_enemies : bool = false


func _on_spawn_timer_timeout():
	if ready_to_spawn_enemies:
		spawn_enemies()


func spawn_enemy_set_random_location(new_enemy):
	enemy_spawn_location.progress_ratio = randf()
	new_enemy.global_position = enemy_spawn_location.global_position
	
	#get the tile the enemy is standing on
	var new_enemy_tile_position = tile_map.get_cell_atlas_coords(0,tile_map.local_to_map(new_enemy.position))
	
	
	#check if the tile is one of the full ground tiles
	if  new_enemy_tile_position == Vector2i(1,1) || new_enemy_tile_position == Vector2i(4,1):
		pass
	else:
		spawn_enemy_set_random_location(new_enemy)


func spawn_enemies():
	for enemy in enemies_spawned:
		
		if GameManager.enemy_count < 600:
			var new_enemy = enemy.instantiate()
			
			new_enemy.movement_speed += randi_range(1,20)
			
			spawn_enemy_set_random_location(new_enemy)
			
			get_tree().get_current_scene().add_child(new_enemy)
	
