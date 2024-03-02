class_name Entity
extends CharacterBody2D

@export var entity_name:String = "Nameless"


@export_category("Health")
@export var max_health:int = 1
@export var current_health:int = max_health
@export var health_regeneration:int = 0

@export var invulnerable:bool = false

@export_category("statistics")
@export var movement_speed:int

@export_category("Other")
@export var faction:String


func _ready():
	motion_mode = MOTION_MODE_FLOATING



func take_damage(damage):
	pass
	

func get_health() ->int:
	return current_health

func set_health(new_health):
	current_health = new_health

func get_faction() ->String:
	return faction
