extends Node2D

@onready var enemy_death_sounds = %EnemyDeathSounds




func _ready():
	GameManager.connect("enemy_death", _on_enemy_death)



func _on_enemy_death(death_position):
	
	enemy_death_sounds.global_position = death_position
	
	enemy_death_sounds.play()
