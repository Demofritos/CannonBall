extends CharacterBody2D

const GRAVITY : int = 1000
const MAX_VEL : int =600
var flying : bool = false
var falling : bool = false
const START_POS = Vector2(100, 400)

func _ready():
	falling = false
	flying = false
	position = START_POS
	
