class_name Player
extends Entity

@onready var attack_point = %AttackPoint

@onready var animated_sprite_2d = %AnimatedSprite2D
@onready var flash_animation = %"Flash animation"
@onready var hit_sound = %Hitsound


var current_experience:int = 0

var current_level:int = 1

var weapon_scale: float = 1

var damage_bonus:int = 0

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



func check_health():
	if(!super.check_health()):
		GameManager.player_death_location = global_position
		GameManager.emit_signal("game_over")
		


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
	
	max_health += randi_range(5,10)
	movement_speed += randi_range(0,5)
	weapon_scale += randf_range(.1,.3)
	damage_bonus += randi_range(1,3)
	
	
	
	current_health = max_health
	
	


func take_damage(damage: int):
	super.take_damage(damage)
	flash_animation.play("flash")
	
	hit_sound.pitch_scale = randf_range(.2,3)
	hit_sound.volume_db = randf_range(-7,7)
	hit_sound.play()


func get_level()-> int:
	return current_level
