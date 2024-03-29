class_name Entity
extends CharacterBody2D

const CORPSE = preload("res://entities/corpse/corpse.tscn")

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
@export var corpse_sprite: Texture2D
@export var experience_contained:int = 0

@export_category("Weapons")
@export var weapon_origin:Marker2D

var is_flipped = false


func _ready():
	set_motion_mode(MOTION_MODE_FLOATING)
	
	
	current_health = max_health



func take_damage(damage: int):
	print(entity_name, " took ", damage, " damage")
	current_health -= damage
	check_health()

func check_health() -> bool:
	if current_health <= 0 && invulnerable == false:
		print(entity_name, " has died")
		
		call_deferred("spawn_corpse",corpse_sprite)
		
		queue_free()
		return false
		
	return true


func spawn_corpse(corpse_sprite):
	var new_corpse = CORPSE.instantiate()
	
	
	new_corpse.position = position
	new_corpse.is_flipped = is_flipped
	
	get_parent().add_child(new_corpse)
	new_corpse.initialize_variables(experience_contained,corpse_sprite)




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
