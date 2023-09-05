extends Node2D

func _ready():
	if Global.player2_score > Global.player1_score:
		$RichTextLabel.bbcode_text = "\n[center]Player 2 ganhou![/center]"
		$Chicken2.texture = load("res://assets/Material freeway/galinha/chicken.png")
		$Chicken.texture = load("res://assets/Material freeway/galinha/chicken2.png")
		$AnimationPlayer.play("galinha_feliz")
	elif Global.player2_score == Global.player1_score:
		$RichTextLabel.bbcode_text = "\n[center]Empate![/center]"
		$Chicken2.position.x = 606
		$Chicken2.position.y = 391
		
	

	




func _on_Button_pressed():
	Global.level = 1
	Global.player1_score = 0
	Global.player2_score = 0
	
	get_tree().change_scene("res://scenes/MainMenu.tscn")
	
