extends StaticBody2D


@onready var area_2d = %Area2D
@onready var animated_sprite_2d = %AnimatedSprite2D


func _ready():
	animated_sprite_2d.frame = randi_range(0,10)
	animated_sprite_2d.play("default")


func _on_area_2d_body_entered(body):
	if body.is_in_group("player"):
		animated_sprite_2d.modulate.a = 0.5



func _on_area_2d_body_exited(body):
	if body.is_in_group("player"):
		animated_sprite_2d.modulate.a = 1
