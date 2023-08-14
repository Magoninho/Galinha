extends Node2D

export var speed = 200
export var left = false
func _ready():
	for i in self.get_children():
		i.speed = speed
		i.left = left
		i._ready()
