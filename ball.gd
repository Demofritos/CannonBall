extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -300
const GRAVITY = 980


func _physics_process(delta: float) -> void:
	velocity.x = 100
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
