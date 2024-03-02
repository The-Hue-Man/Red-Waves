class_name Enemy
extends Entity

var direction: Vector2 = Vector2(0,0)

var target_position: Vector2 = Vector2(0,0)
var target_locked: bool = false

func _ready():
	
	faction = "enemy"



func _physics_process(delta):
	
	if target_locked:
		chase()
	
	
	_movement()
	


func _movement():
	velocity = direction * movement_speed
	move_and_slide()

func chase():
	var target = GameManager.get_player_global_position()
	direction = global_position.direction_to(target)

func _on_area_2d_body_entered(body):
	if body.is_in_group("PlayerGroup"):
		target_locked = true
		
