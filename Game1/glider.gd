extends CharacterBody2D

const GRAV = 50
const LIFT_VEL = 350.0

var GAMEOVER

signal game_over

func _ready():
	position.x = 20
	position.y = 100
	GAMEOVER = false

func _process(delta):
	if Input.is_action_pressed("lift"):
		if GAMEOVER == false:
			velocity.y -= LIFT_VEL * delta
	
	if GAMEOVER == true:
		velocity.y = 0
		game_over.emit()

func _physics_process(delta):
	if GAMEOVER == false:
		velocity.y += GRAV * delta
	
	move_and_slide()

# floor
func _on_bounds_body_entered(_body):
	GAMEOVER = true
	position.y = 80

#ceiling
func _on_bounds_2_body_entered(_body):
	GAMEOVER = true
	position.y = 176

func _on_bg_player_collide():
	GAMEOVER = true

func _on_bg_2_player_collide():
	GAMEOVER = true


func _on_bg_offscreen():
	pass # Replace with function body.


func _on_bg_2_offscreen():
	pass # Replace with function body.
