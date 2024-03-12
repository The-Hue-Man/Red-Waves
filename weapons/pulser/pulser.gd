extends Weapon

@onready var pulse_cooldown = %Cooldown
@onready var audio_stream_player_2d = %AudioStreamPlayer2D




func _ready():
	super._ready()
	
	GameManager.connect("player_levelled_up", _on_player_level_up)
	





func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	
	var new_attack = attack_scene.instantiate()
	new_attack.scale += Vector2(weapon_owner.weapon_scale,weapon_owner.weapon_scale) / 10
	new_attack.factions_targeted.assign(factions_targeted)
	new_attack.damage = damage + weapon_owner.damage_bonus / 8
	
	audio_stream_player_2d.play()
	
	get_parent().add_child(new_attack)
	
	pulse_cooldown.start()

func _on_player_level_up():
	if weapon_owner.current_level == 25:
		pulse_cooldown.set_wait_time(weapon_cooldown)
		pulse_cooldown.start()


func _on_cooldown_timeout():
	attack(weapon_origin,Vector2(0,0),area)
