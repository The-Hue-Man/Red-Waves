class_name BigSlime
extends Enemy

@onready var animated_sprite_2d = %AnimatedSprite2D


#currently unused
@onready var damage_timer = %DamageTimer
var touching_player = false


func _ready():
	super._ready()
	
	
	
	animated_sprite_2d.play()
	


func _process(delta):
	if touching_player && damage_timer.is_stopped():
		GameManager.player.take_damage(contact_damage)
		damage_timer.start()


func _physics_process(_delta):
	
	#target_player()
	_move()
	


func _on_damage_box_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(contact_damage)
		touching_player = true
		damage_timer.start()
		
		
	
	#if body.is_in_group("enemy"):
	#	neighbors.append(body)





func _on_damage_box_body_exited(body):
	if body.is_in_group("enemy"):
		neighbors.erase(body)
	
	if body.is_in_group("player"):
		touching_player = false

