class_name Enemy
extends Entity

var direction: Vector2 = Vector2(0,0)

var target_position: Vector2 = Vector2(0,0)
var target_locked: bool = false

@export var enemy_sprite: AnimatedSprite2D
@export var contact_damage:int = 1


var neighbors: Array


func _ready():
	#Calls the Entity class Ready function
	super._ready()
	
	enemy_sprite.flip_h = randi_range(0,1)
	faction = "enemy"
	add_to_group("enemy")
	
	set_max_slides(1)

	GameManager.enemy_count += 1



func _move():
	velocity = direction * movement_speed
	
	#for i in neighbors:
	#	if abs(i.position - GameManager.get_player_global_position()) < abs(position - GameManager.get_player_global_position()):
	#		velocity /= 1.5
	#	
	
	
	move_and_slide()


func target_player():
	var target = GameManager.get_player_global_position()
		
	direction = global_position.direction_to(target)
	
	#delete enemy if too far away from player
	if abs(target[0] - position.x) > 550 || abs(target[1] - position.y) > 300:
		queue_free()
		GameManager.enemy_count -= 1
	
	
	if target.x > position.x:
		enemy_sprite.flip_h = true
	else:
		enemy_sprite.flip_h = false
