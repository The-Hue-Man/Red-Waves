class_name Corpse
extends Area2D

var experience_contained:int

func initialize_variables(input_experience:int = 0):
	experience_contained = input_experience
	add_to_group("corpse")
	
