extends Node2D

signal goal_left
signal goal_right


func _on_goal_left_body_entered(body):
	goal_left.emit()


func _on_goal_right_body_entered(body):
	goal_right.emit()
