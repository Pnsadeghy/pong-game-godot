extends Node

class_name AiInputComponent

@export var ball_path: NodePath
var racket
var ball

func _ready():
	racket = get_parent()
	racket.connect("update", calculate_velocity)
	ball = get_node(ball_path)
	
	
func calculate_velocity():
	if not "direction" in racket:
		return
		
	racket.direction = Vector2(0, get_ball_direcrion())

func get_ball_direcrion():
	if abs(racket.position.y - ball.position.y) > 20:
		if racket.position.y < ball.position.y:
			return 1
		else:
			return -1
	else:
		return 0
