extends Weapon

@onready var cooldown_timer = %Cooldown
@onready var audio_stream_player_2d = %AudioStreamPlayer2D


func _ready():
	cooldown_timer.set_wait_time(weapon_cooldown)


func attack(attack_origin:Marker2D,target:Vector2,input_area:float):
	var new_attack = attack_scene.instantiate()
	new_attack.position = attack_origin.position
	new_attack.look_at(target)
	
	audio_stream_player_2d.pitch_scale = randf_range(2.9,3.9)
	audio_stream_player_2d.volume_db = randf_range(-40,-36)
	audio_stream_player_2d.play()
	
	new_attack.scale = Vector2(weapon_owner.weapon_scale,weapon_owner.weapon_scale)
	new_attack.factions_targeted.assign(factions_targeted)
	new_attack.damage = damage + weapon_owner.damage_bonus / 4
	
	
	get_parent().add_child(new_attack)



func _on_cooldown_timeout():
	cooldown_timer.set_wait_time(weapon_cooldown)
	attack(weapon_origin,get_local_mouse_position(),area)

