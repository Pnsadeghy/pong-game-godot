extends Control


func set_timer(time):
	$CountdownContainer/CenterContainer/Label.set_text(str(time))
	
func show_timer():
	$CountdownContainer.visible = true

func hide_timer():
	$CountdownContainer.visible = false
	
func set_player_score(value):
	$PointsDisplay/ScorePlayer.set_text(str(value))
	
func set_ai_score(value):
	$PointsDisplay/ScoreEnemy.set_text(str(value))
