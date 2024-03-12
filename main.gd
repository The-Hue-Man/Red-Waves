extends Node2D

@onready var enemy_death_sounds = %EnemyDeathSounds
@onready var loop_player = %LoopPlayer



func _ready():
	GameManager.connect("enemy_death", _on_enemy_death)



func _on_enemy_death(death_position):
	
	enemy_death_sounds.global_position = death_position
	enemy_death_sounds.pitch_scale = randf_range(.65,4)
	enemy_death_sounds.volume_db = randf_range(-7,6)
	enemy_death_sounds.play()




func _on_intro_player_finished():
	
	loop_player.play()
