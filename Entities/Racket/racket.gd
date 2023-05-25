extends CharacterBody2D

signal update

@export var move_speed = 250
var direction = Vector2()

func _process(delta):
	update.emit()

func _physics_process(delta):
	if direction.length() > 0:
		move_and_collide(direction * (move_speed * delta))
