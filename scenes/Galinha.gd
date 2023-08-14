extends KinematicBody2D
class_name Player

signal dead

var velocity = Vector2()

export var speed = 120
var looking = "up"
var dead = false

func reset():
	$AnimatedSprite.play("up")
	dead = false
	self.set_physics_process(true)
	position.x = 622
	position.y = 691

func die():
	self.emit_signal("dead")
	dead = true
	self.set_physics_process(false)
	$AnimatedSprite.play("dead")

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
	
	if not dead:
		$AnimatedSprite.play(looking)
	else:
		$AnimatedSprite.play("dead")

	if velocity == Vector2(0, 0):
		$AnimatedSprite.playing = false

	velocity = move_and_slide(velocity)
