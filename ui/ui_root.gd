extends CanvasLayer


@export var end_screen : Control




func _ready():
	end_screen.visible = false
	GameManager.connect("game_over", _on_game_over)


func _on_game_over():
	end_screen.visible = true
	end_screen.set_score(GameManager.score)
