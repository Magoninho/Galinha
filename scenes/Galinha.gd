extends KinematicBody2D

var velocity = Vector2()

export var speed = 120
var looking = "up"

func _physics_process(delta):
	
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("ui_up"):
		velocity.y = -speed
		looking = "up"
	if Input.is_action_pressed("ui_down"):
		velocity.y = speed
		looking = "down"
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	if Input.is_action_pressed("ui_left"):
		velocity.x = -speed
	$AnimatedSprite.play(looking)

	if velocity == Vector2(0, 0):
		$AnimatedSprite.playing = false

	velocity = move_and_slide(velocity)
