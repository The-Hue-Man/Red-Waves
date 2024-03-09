extends Weapon

@onready var cooldown_timer = %Cooldown




func _ready():
	cooldown_timer.set_wait_time(weapon_cooldown)


func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.position = attack_origin.position
	new_attack.look_at(target)
	
	new_attack.scale = Vector2(input_area,input_area)
	new_attack.factions_targeted.assign(factions_targeted)
	new_attack.damage = damage
	
	
	get_parent().add_child(new_attack)



func _on_cooldown_timeout():
	cooldown_timer.set_wait_time(weapon_cooldown)
	attack(weapon_origin,get_local_mouse_position(),area)

