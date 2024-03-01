class_name Entity
extends CharacterBody2D

@export var entity_name:String = "Nameless"


@export_category("Health")
@export var max_health:int = 1
@export var current_health:int = max_health
@export var health_regeneration:int = 0

@export var invulnerable:bool = false

@export_category("Other")
@export var movement_speed:int

@export var faction:String



func take_damage():
	pass
	


func get_health() ->int:
	return current_health


func move(direction):
	
	velocity += direction * movement_speed
	
	move_and_slide()
	


