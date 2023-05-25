extends Node

var hud

var score_player = 0
var score_ai = 0

var max_score = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	hud = $CanvasLayer/HUD
	$StartTime.start()
	
func _process(delta):
	if $StartTime.time_left > 0:
		hud.set_timer(ceil($StartTime.time_left))

func _on_field_goal_left():
	score_ai += 1
	on_goal()


func _on_field_goal_right():
	score_player += 1
	on_goal()
	
func on_goal():
	$Camera2D.on_shake()
	if score_player == max_score or score_ai == max_score:
		$Ball.stop()
		var text = "You loose"
		if score_player == max_score:
			text = "You win"
		$CanvasLayer/FinalScreen.visible = true
		$CanvasLayer/FinalScreen.show_winner(text)
	else:
		start_new_round()
		
func start_new_round():
	$Ball.reset()
	$Racket.set_position(Vector2(924, 256))
	$Player.set_position(Vector2(100, 256))
	$StartTime.start()
	hud.show_timer()
	update_score()
	
func _on_start_time_timeout():
	hud.hide_timer()
	$Ball.set_start_direction()
	
func update_score():
	hud.set_player_score(score_player)
	hud.set_ai_score(score_ai)


func _on_final_screen_new_round():
	$CanvasLayer/FinalScreen.visible = false
	score_ai = 0
	score_player = 0
	start_new_round()


func _on_final_screen_exit():
	get_tree().quit()
