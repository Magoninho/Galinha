extends Node2D

func _ready():
	$UI/Level.text = "LEVEL " + str(Global.level)

func _on_Finish_body_entered(body):
	$SFX/Win.play()
	$Resetables/Galinha.set_physics_process(false)
	$Delay.start()


func _on_Galinha_dead():
	if not $Resetables/Galinha.dead:
		$SFX/Death.playing = true
	$GameOver.visible = true


func _on_Delay_timeout():
	Global.level += 1
	$Resetables/Galinha.set_physics_process(true)
	get_tree().change_scene("res://scenes/levels/Level" + str(Global.level) + ".tscn")
