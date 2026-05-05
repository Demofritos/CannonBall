extends CharacterBody2D

@export var spike: PackedScene

const SPEED = 300.0
const JUMP_VELOCITY = -300
const GRAVITY = 980

@export var threshold_increment: int = 100
var current_threshold  : int = 0

func _ready():
	current_threshold = global_position.x


func _physics_process(delta: float) -> void: 
	velocity.x = 100
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	if move_and_slide():
		var n = get_slide_collision_count()
		for i in range(n):
			var c = get_slide_collision(i)
			if Spikey._is_spikey(c.get_collider()):
				get_tree().change_scene_to_file("res://game_over.tscn")
				break
				
	if position.x > current_threshold:
		current_threshold += threshold_increment
		var top = spike.instantiate()
		var bot = spike.instantiate()
		
		get_parent().add_child(top)
		get_parent().add_child(bot)
		
		var gap = randi_range(228, 388 )
		
		top.global_position = global_position + Vector2(100, -gap / 2)
		bot.global_position = global_position + Vector2(100,  gap / 2)
