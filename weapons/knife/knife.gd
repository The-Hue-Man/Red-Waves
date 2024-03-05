extends Weapon


func attack(attack_origin:Marker2D,target:Vector2,area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.position = weapon_origin.position
	new_attack.look_at(target)
	
	new_attack.area = area
	
	get_parent().add_child(new_attack)



func _on_cooldown_timeout():
	attack(weapon_origin,get_local_mouse_position(),area)

