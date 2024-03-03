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
	set_motion_mode(MOTION_MODE_FLOATING)
	current_health = max_health


func take_damage(damage: int):
	print(entity_name, " took ", damage, " damage")
	current_health -= damage
	check_health()

func check_health():
	if current_health <= 0:
		print(entity_name, " has died")
		queue_free()


func get_health() ->int:
	return current_health

func set_health(new_health: int):
	current_health = new_health


func get_faction() ->String:
	return faction

func set_faction(new_faction: String):
	faction = new_faction

func get_invulnerability() -> bool:
	return invulnerable

func set_invulnerability(state: bool):
	invulnerable = state
