extends Node2D

var galinhas = []

func _ready():
	self.update_scoreboard()
	$UI/Level.text = "LEVEL " + str(Global.level)
	for body in $Resetables.get_children():
		if body is Player:
			galinhas.append(body)

func update_scoreboard():
	$UI/Player1Score.text = str(Global.player1_score)
	$UI/Player2Score.text = str(Global.player2_score)

func _on_Finish_body_entered(body):
	$SFX/Win.play()
	if body.player_2:
		Global.player2_score += 1
	else:
		Global.player1_score += 1
	
	self.update_scoreboard()
	for c in $Resetables.get_children():
		c.set_physics_process(false)
	$Delay.start()


func _on_Galinha_dead():
	$SFX/Death.playing = true
	
	if galinhas[0].dead and galinhas[1].dead:
		$GameOver.visible = true
	


func _on_Delay_timeout():
	if Global.level + 1 > 10:
		get_tree().change_scene("res://scenes/Winner.tscn")
	else:
		Global.level += 1
		$Resetables/Galinha.set_physics_process(true)
		get_tree().change_scene("res://scenes/levels/Level" + str(Global.level) + ".tscn")
