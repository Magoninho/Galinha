extends Node2D

var mode = 0

func _ready():
	# reseting values
	Global.level = 1
	Global.player1_score = 0
	Global.player2_score = 0

func _process(delta):
	if Input.is_action_just_pressed("ui_up"):
		if mode == 0: mode = 1
		else: mode = 0
	if Input.is_action_just_pressed("ui_down"):
		if mode == 1: mode = 0
		else: mode = 1
	if Input.is_action_just_pressed("ui_accept"):
		if mode == 0:
			get_tree().change_scene("res://scenes/levels/Level" + str(Global.level) + ".tscn")
		else:
			get_tree().change_scene("res://scenes/TwoPlayerGame.tscn")
		MusicController.play_theme()
			
	
	if mode == 0:
		$"1Player".text = ">1 PLAYER"
	else:
		$"1Player".text = " 1 PLAYER"
	
	if mode == 1:
		$"2Player".text = ">2 PLAYERS"
	else:
		$"2Player".text = " 2 PLAYERS"
