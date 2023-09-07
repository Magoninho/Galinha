extends Node2D

var galinhas = []

func randomize_cars():
	for node in $Carros.get_children():
		randomize()
		node.set_speed(rand_range(100, 500))
		randomize()
		node.set_left([true, false][randi() % 2])

func _ready():
	self.randomize_cars()
	self.update_scoreboard()
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

func there_is_winner():
	if Global.player1_score == 5 or Global.player2_score == 5:
		return true

func _on_Delay_timeout():
	if there_is_winner():
		get_tree().change_scene("res://scenes/Winner.tscn")
		return
	self.randomize_cars()
	for node in $Resetables.get_children():
		node.reset()
