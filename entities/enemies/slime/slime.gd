class_name Slime
extends Enemy

@onready var animated_sprite_2d = %AnimatedSprite2D



func _ready():
	super._ready()
	
	animated_sprite_2d.play()
	


func _physics_process(_delta):
	
	#target_player()
	
	_move()
	


func _on_damage_box_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(contact_damage)

