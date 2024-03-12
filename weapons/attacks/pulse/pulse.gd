extends Attack


@onready var animation_player = %AnimationPlayer
@onready var animated_sprite_2d = %AnimatedSprite2D
@onready var audio_stream_player_2d = %AudioStreamPlayer2D



func _ready():
	animated_sprite_2d.visible = true
	animation_player.play("pulse")
	

func _on_body_entered(body):
	
	audio_stream_player_2d.pitch_scale = randf_range(.9,1.2)
	audio_stream_player_2d.volume_db = randf_range(-32,-10)
	audio_stream_player_2d.play()
	
	for group in factions_targeted:
		if body.is_in_group(group):
			body.take_damage(damage)






func _on_animation_player_animation_finished(_anim_name):
	queue_free()
