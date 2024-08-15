extends Sprite2D

const SPEED = 0.5
const OFFSET = 160
const SCREEN_WIDTH = 320

@onready var top_pipe = $pipe2
@onready var bot_pipe = $pipe

signal player_collide
signal offscreen

func _ready():
	bot_pipe.position.x = randi_range(20, 140)
	top_pipe.position.x = randi_range(20, 140)

func _process(_delta):
	position.x -= SPEED
	
	if position.x <= -OFFSET:
		position.x = SCREEN_WIDTH + OFFSET
		bot_pipe.position.x = randi_range(20, 140)
		top_pipe.position.x = randi_range(20, 140)
		offscreen.emit()
		
		

func _on_pipe_body_entered(_body):
	player_collide.emit()

func _on_pipe_2_body_entered(_body):
	player_collide.emit()
