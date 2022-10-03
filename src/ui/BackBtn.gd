extends Button

func _on_BackBtn_pressed():
	globals.playerHealth = 100
	var _trash = get_tree().change_scene("res://scn/UI/mainMenu.tscn")
