extends CharacterBody2D

const GRAV = 200
const LIFT_VEL = 1500.0
const MAX_VEL = 500.0

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
			if velocity.y > MAX_VEL:
				velocity.y = MAX_VEL
		if GAMEOVER == true:
			get_tree().reload_current_scene()
	
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
