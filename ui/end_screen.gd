extends Control

@onready var score_label = $VBoxContainer/ScoreLabel



func _on_exit_button_pressed():
	get_tree().quit()


func _on_restart_button_pressed():
	get_tree().reload_current_scene()
	GameManager.enemy_count = 0
	GameManager.score = 0



func set_score(score):
	score_label.text = "Score: " + str(score)
