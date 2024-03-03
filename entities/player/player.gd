class_name Player
extends Entity


@onready var animated_sprite_2d = %AnimatedSprite2D




func _ready():
	#Calls the Entity class Ready function
	super._ready()
	
	
	faction = "player"
	animated_sprite_2d.play("Idle")

func _physics_process(delta):
	movement(_get_move_input())
	


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
		pass
	
	
	
	
	pass



