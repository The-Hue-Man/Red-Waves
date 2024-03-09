class_name Weapon
extends Node2D


@export var weapon_name:String
@export var damage:int
@export var area:float = 1
@export var factions_targeted:Array[String]
@export var weapon_cooldown:float = .9

@export var weapon_origin: Marker2D

@export var attack_scene:PackedScene


func _ready():
	pass



func attack(_attack_origin:Marker2D,_target:Vector2,_input_area:float):
	pass


