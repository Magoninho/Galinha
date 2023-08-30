extends CanvasLayer

export var resetables_path: NodePath

onready var resetables = get_node(resetables_path)

func reset_all_resetables():
	for node in resetables.get_children():
		node.reset()

func _process(delta):
	if Input.is_action_just_pressed("ui_accept") and self.visible:
		self.visible = false
		self.reset_all_resetables()

func _on_Button_pressed():
	if self.visible:
		self.reset_all_resetables()
