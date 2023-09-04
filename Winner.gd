extends Node2D

func _ready():
	if Global.player2_score > Global.player1_score:
		$RichTextLabel.bbcode_text = "\n[center]Player 2 ganhou![/center]"
		$Chicken2.texture = load("res://assets/Material freeway/galinha/chicken.png")
		$Chicken.texture = load("res://assets/Material freeway/galinha/chicken2.png")
	
	$AnimationPlayer.play("galinha_feliz")




func _on_Button_pressed():
	get_tree().change_scene("res://scenes/MainMenu.tscn")