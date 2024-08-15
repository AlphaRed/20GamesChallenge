extends Label

var score

func _ready():
	visible = false
	score = 0

func _on_bg_offscreen():
	score += 10

func _on_bg_2_offscreen():
	score += 10

func _on_glider_game_over():
	visible = true
	text = "Score: " + str(score)
