extends KinematicBody2D
class_name Player

signal dead

var velocity = Vector2()

export var speed = 120
export var player_2 = false
var looking = "up"
var dead = false
var dead_animation

var controllers = ["ui_up", "ui_down", "ui_right", "ui_left"]
var animations = ["up", "down"]

func _ready():
	dead_animation = "dead"
	if player_2:
		for i in range(4):
			controllers[i] += "_2"
		
		for i in range(2):
			animations[i] += "_2"
		looking = animations[0]
		dead_animation += "2"

func reset():
	$AnimatedSprite.play(animations[0])
	dead = false
	self.set_physics_process(true)
	if player_2:
		position.x = 424
		position.y = 693
	else:
		position.x = 782
		position.y = 695

func die():
	if dead: return
	dead = true
	self.emit_signal("dead")
	self.set_physics_process(false)
	$AnimatedSprite.play(dead_animation)

func _physics_process(delta):
	
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed(controllers[0]):
		velocity.y = -speed
		looking = animations[0]
	if Input.is_action_pressed(controllers[1]):
		velocity.y = speed
		looking = animations[1]
	if Input.is_action_pressed(controllers[2]):
		velocity.x = speed
	if Input.is_action_pressed(controllers[3]):
		velocity.x = -speed
	
	if not dead:
		$AnimatedSprite.play(looking)
	else:
		$AnimatedSprite.play(dead_animation)

	if velocity == Vector2(0, 0):
		$AnimatedSprite.playing = false

	velocity = move_and_slide(velocity)
