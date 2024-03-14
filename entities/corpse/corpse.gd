class_name Corpse
extends Area2D

@onready var sprite_2d = %Sprite2D
var is_flipped : bool
var experience_contained:int

func initialize_variables(input_experience:int = 0, sprite :Texture2D = sprite_2d.texture):
	experience_contained = input_experience
	sprite_2d.texture = sprite
	
	if is_flipped:
		sprite_2d.flip_h = true
	
	add_to_group("corpse")
	
