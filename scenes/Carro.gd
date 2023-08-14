extends Area2D
class_name Carro


export var speed = 200
export var type = 1

var left = false
var velocity = Vector2()
func _ready():
	self.rotation_degrees = -90 if left else 90
	change_color()
	$Sprite.texture = load("res://assets/Material freeway/carros/coches (" + str(type) + ").png")

func change_color():
	randomize()
	type = int(rand_range(1, 14))

func reset():
	global_position.x = 1300 if left else -100
	change_color()
	$Sprite.texture = load("res://assets/Material freeway/carros/coches (" + str(type) + ").png")

func _physics_process(delta):
	if left:
		
		position.x += -speed * delta
	else:
		position.x += speed * delta
	
	if global_position.x < -100 or global_position.x > 1300:
		reset()


func _on_Carro_body_entered(body):
	if body is Player:
		body.die()
