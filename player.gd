extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_VEL : int =600
func _process(delta: float) -> void:
	if Input.is_action_pressed("jump_up"):
		position += Vector2(0, -100) * delta
var gravity = 100 
