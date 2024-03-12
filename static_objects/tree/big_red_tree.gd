extends StaticBody2D


@onready var sprite_2d = %Sprite2D
@onready var area_2d = %Area2D





func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		sprite_2d.modulate.a = 0.5



func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		sprite_2d.modulate.a = 1
