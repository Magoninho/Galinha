extends Area2D

export var carros: NodePath
var environment;



var previous_speed

func _ready():
	environment = $WorldEnvironment.get_environment()
	$WorldEnvironment.set_environment(null)

func speed_up():
	$WorldEnvironment.set_environment(null)
	var car_manager = get_node(carros)
	for i in car_manager.get_children():
		var carros = i.get_children()
		for c in range(len(carros)):
			carros[c].reset_speed()

func slow_down():
	$WorldEnvironment.set_environment(environment)
	$Delay.start()
	var car_manager = get_node(carros)
	for i in car_manager.get_children():
		var carros = i.get_children()
		for c in range(len(carros)):
			carros[c].speed -= 0.7 * carros[c].speed


func _on_Delay_timeout():
	speed_up()

func reset():
	if position.x < 0:
		position.x += 9999

func _on_Clock_body_entered(body):
	position.x -= 9999
	if body is Player:
		slow_down()
