extends CanvasLayer

export var galinha_path: NodePath

onready var galinha = get_node(galinha_path)

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and galinha.dead:
		galinha.reset()
		self.visible = false

func _on_Button_pressed():
	galinha.reset()
	self.visible = false
