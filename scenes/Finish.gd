extends Node2D


func _ready():
	MusicController.stop_theme()


func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")
