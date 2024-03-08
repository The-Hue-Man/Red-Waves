extends Attack


@onready var animation_player = %AnimationPlayer
@onready var animated_sprite_2d = %AnimatedSprite2D



func _ready():
	print("pulse")
	animated_sprite_2d.visible = true
	animation_player.play("pulse")
	

func _on_body_entered(body):
	print("pulse hit")
	
	for group in factions_targeted:
		if body.is_in_group(group):
			body.take_damage(damage)






func _on_animation_player_animation_finished(_anim_name):
	queue_free()
