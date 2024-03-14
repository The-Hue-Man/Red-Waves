class_name BiggestSlime
extends Enemy

@onready var animated_sprite_2d = %AnimatedSprite2D

@onready var damage_timer = %DamageTimer

var touching_player = false


func _ready():
	super._ready()
	
	add_to_group("big_bois")
	animated_sprite_2d.play()
	

func _process(delta):
	if touching_player && damage_timer.is_stopped():
		GameManager.player.take_damage(contact_damage)
		damage_timer.start()
	
	
	for a in $Damage_box.get_overlapping_areas():
		if a.is_in_group("corpse"):
			experience_contained += a.experience_contained
			current_health += 1
			a.queue_free()
	
	



func target_player():
	var target = GameManager.get_player_global_position()
		
	direction = global_position.direction_to(target)
	



func _physics_process(_delta):
	
	#target_player()
	_move()
	


func _on_damage_box_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(contact_damage)
		touching_player = true
		damage_timer.start()
	if body.is_in_group("enemy"):
		if body.is_in_group("big_bois"):
			return;
		body.take_damage(contact_damage * 1000)


func _on_damage_box_body_exited(body):
	
	if body.is_in_group("player"):
		touching_player = false
