extends Attack


@onready var hit_box = %HitBox
@onready var duration = %Duration
@onready var animated_sprite_2d = %AnimatedSprite2D


func _ready():
	apply_scale(Vector2(area,area))
	animated_sprite_2d.play("default")



func _on_body_entered(body):
	for group in factions_targeted:
		if body.is_in_group(group):
			body.take_damage(damage)


func _on_duration_timeout():
	queue_free()
