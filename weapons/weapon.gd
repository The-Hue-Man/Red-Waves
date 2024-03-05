class_name Weapon
extends Node2D


@onready var cooldown = %Cooldown


@export var weapon_name:String
@export var damage:int
@export var area:float = 1
@export var factions_targeted:Array[String]
@export var weapon_cooldown:float = .9

@export var weapon_origin: Marker2D



@export var attack_scene:PackedScene


var new_timer = Timer.new()

func _ready():
	cooldown.wait_time = weapon_cooldown



func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.position = weapon_origin.position
	
	new_attack.area = input_area
	
	get_parent().add_child(new_attack)


