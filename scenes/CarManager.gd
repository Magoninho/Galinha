extends Node2D

export var speed = 200
export var left = false
func _ready():
	self.set_speed(speed)
	self.set_left(left)

func set_speed(speed):
	for i in self.get_children():
		i.speed = speed
		i._ready()

func set_left(left):
	for i in self.get_children():
		i.left = left
		i._ready()
	
