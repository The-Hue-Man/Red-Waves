class_name Player
extends Entity

@onready var attack_point = %AttackPoint

@onready var animated_sprite_2d = %AnimatedSprite2D
const STAB = preload("res://attacks/stab.tscn")



func _ready():
	#Calls the Entity class Ready function
	super._ready()
	add_to_group("player")
	
	faction = "player"
	animated_sprite_2d.play("Idle")

func _physics_process(delta):
	movement(_get_move_input())
	_attack()


func _get_move_input() -> Vector2:
	var vertical = Input.get_axis("up", "down")
	var horizontal = Input.get_axis("left", "right")
	
	return Vector2(horizontal, vertical)
	

func movement(direction):
	velocity = Vector2(0,0)
	
	velocity += direction.normalized() * movement_speed
	
	if velocity.x < 0:
		animated_sprite_2d.flip_h = true
	if velocity.x > 0:
		animated_sprite_2d.flip_h = false
	
	move_and_slide()




func _attack():
	if Input.is_action_pressed("attack"):
		var attack = STAB.instantiate()
		attack.global_position = attack_point.global_position
		
		attack.look_at(get_global_mouse_position())
		
		get_parent().add_child(attack)
	
	
	pass


