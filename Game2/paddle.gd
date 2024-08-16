extends CharacterBody2D

func _ready():
	pass # Replace with function body.

func _process(_delta):
	if Input.is_action_pressed("move_left"):
		velocity.x -= 10
	if Input.is_action_pressed("move_right"):
		velocity.x += 10

func _physics_process(_delta):
	move_and_slide()
