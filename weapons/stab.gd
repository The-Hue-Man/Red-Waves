extends Weapon


@onready var hit_box = %HitBox
@onready var duration = %Duration


func _ready():
	print("stab")
	hit_box.apply_scale(Vector2(area,area))




func _on_body_entered(body:Entity):
	for group in factions_targeted:
		if body.is_in_group(group):
			body.take_damage(damage)


func _on_duration_timeout():
	queue_free()
