extends Weapon


func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.position = attack_origin.position
	new_attack.look_at(target)
	
	new_attack.scale = Vector2(input_area,input_area)
	new_attack.factions_targeted.assign(factions_targeted)
	new_attack.damage = damage
	
	
	get_parent().add_child(new_attack)



func _on_cooldown_timeout():
	attack(weapon_origin,get_local_mouse_position(),area)

