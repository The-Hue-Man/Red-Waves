extends Weapon

@onready var pulse_cooldown = %Cooldown


func _ready():
	super._ready()
	
	pulse_cooldown.set_wait_time(weapon_cooldown)
	pulse_cooldown.start()

func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.scale = Vector2(input_area,input_area)
	new_attack.factions_targeted.assign(factions_targeted)
	new_attack.damage = damage
	
	get_parent().add_child(new_attack)
	
	pulse_cooldown.start()


func _on_cooldown_timeout():
	attack(weapon_origin,Vector2(0,0),area)
