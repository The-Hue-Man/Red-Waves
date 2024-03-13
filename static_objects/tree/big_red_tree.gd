extends StaticBody2D


@onready var sprite_2d = %Sprite2D
@onready var area_2d = %Area2D
@onready var collision_shape_2d = $CollisionShape2D
@onready var shadow = $Shadow


func _ready():
	var flip = randi_range(0,1)
	
	if flip:
		sprite_2d.flip_h = flip
		area_2d.position.x += 6
		collision_shape_2d.position.x += 4
		shadow.position.x += 6


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		sprite_2d.modulate.a = 0.5



func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		sprite_2d.modulate.a = 1
