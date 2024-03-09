class_name Player
extends Entity

@onready var attack_point = %AttackPoint

@onready var animated_sprite_2d = %AnimatedSprite2D
@onready var flash_animation = %"Flash animation"

var current_experience:int = 0

var current_level:int = 1


func _ready():
	#Calls the Entity class Ready function
	super._ready()
	add_to_group("player")
	
	faction = "player"
	animated_sprite_2d.play("Idle")


func _physics_process(_delta):
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






func update_experience():
	if get_experience() > experience_needed(current_level):
		levelup()


func add_experience(added_experience:int):
	print("player gained ", added_experience, " experience")
	current_experience += added_experience
	update_experience()

func get_experience()-> int:
	return current_experience


func experience_needed(level) -> int:
	return round(level * level * 500)


func levelup():
	current_level += 1
	
	
	print("player has levelled up to level ", current_level)


func take_damage(damage: int):
	super.take_damage(damage)
	flash_animation.play("flash")


func get_level()-> int:
	return current_level
