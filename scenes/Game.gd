extends Node2D



func _on_Finish_body_entered(body):
	Global.level += 1
	get_tree().change_scene("res://scenes/levels/Level" + str(Global.level) + ".tscn")


func _on_Galinha_dead():
	$GameOver.visible = true
