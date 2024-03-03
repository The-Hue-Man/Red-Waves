class_name Enemy
extends Entity

var direction: Vector2 = Vector2(0,0)

var target_position: Vector2 = Vector2(0,0)
var target_locked: bool = false


func _ready():
	#Calls the Entity class Ready function
	super._ready()
	
	faction = "enemy"
	add_to_group("enemy")


func _move():
	velocity = direction * movement_speed
	move_and_slide()

func target_player():
	var target = GameManager.get_player_global_position()
	direction = global_position.direction_to(target)


