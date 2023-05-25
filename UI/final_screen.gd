extends Control

signal new_round
signal exit

func show_winner(text):
	$VBoxContainer/Result.set_text(text)


func _on_new_pressed():
	new_round.emit()


func _on_exit_pressed():
	exit.emit()
