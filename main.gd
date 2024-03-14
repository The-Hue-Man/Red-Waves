extends Node2D

@onready var enemy_death_sounds = %EnemyDeathSounds
@onready var done = %done
@onready var after = %after
@onready var third = %third

@onready var enemy_spawn_path = %EnemySpawnPath


func _ready():
	GameManager.connect("enemy_death", _on_enemy_death)



func _on_enemy_death(death_position):
	
	enemy_death_sounds.global_position = death_position
	enemy_death_sounds.pitch_scale = randf_range(1.6,3.9)
	enemy_death_sounds.volume_db = randf_range(-1,6)
	enemy_death_sounds.play()




func _on_intro_player_finished():
	third.play()


func _on_enemies_start_spawning_timeout():
	enemy_spawn_path.ready_to_spawn_enemies = true


func _on_done_finished():
	third.play()


func _on_after_finished():
	done.play()


func _on_third_finished():
	after.play()
