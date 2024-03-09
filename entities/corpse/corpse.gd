class_name Corpse
extends Area2D

var experience_contained:int

func initialize_variables(input_experience:int = 0):
	experience_contained = input_experience
	
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.add_experience(experience_contained)
		queue_free()
