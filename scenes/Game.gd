extends Node2D

var galinhas = []
var singleplayer = true

func _ready():
	$UI/Level.text = "LEVEL " + str(Global.level)
	for body in $Resetables.get_children():
		if body is Player:
			galinhas.append(body)

func _on_Finish_body_entered(body):
	$SFX/Win.play()
	for c in $Resetables.get_children():
		c.set_physics_process(false)
	$Delay.start()


func _on_Galinha_dead():
	$SFX/Death.playing = true
	$GameOver.visible = true
	


func _on_Delay_timeout():
	if Global.level + 1 > 10:
		get_tree().change_scene("res://scenes/Finish.tscn")
	else:
		Global.level += 1
		$Resetables/Galinha.set_physics_process(true)
		get_tree().change_scene("res://scenes/levels/Level" + str(Global.level) + ".tscn")
