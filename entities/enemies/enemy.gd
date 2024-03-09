class_name Enemy
extends Entity

var direction: Vector2 = Vector2(0,0)

var target_position: Vector2 = Vector2(0,0)
var target_locked: bool = false

@export var enemy_sprite: AnimatedSprite2D
@export var contact_damage:int = 1



func _ready():
	#Calls the Entity class Ready function
	super._ready()
	
	enemy_sprite.flip_h = randi_range(0,1)
	faction = "enemy"
	add_to_group("enemy")


func _move():
	velocity = direction * movement_speed
	move_and_slide()

func target_player():
	var target = GameManager.get_player_global_position()
		
	direction = global_position.direction_to(target)
	if target.x > position.x:
		enemy_sprite.flip_h = true
	else:
		enemy_sprite.flip_h = false
