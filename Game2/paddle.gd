extends CharacterBody2D

const MAX_VEL = 150

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		velocity.x -= 10
	if Input.is_action_pressed("move_right"):
		velocity.x += 10
	
func _physics_process(_delta):
	if velocity.x > MAX_VEL:
		velocity.x = MAX_VEL
	if velocity.x < -MAX_VEL:
		velocity.x = -MAX_VEL
	move_and_slide()
