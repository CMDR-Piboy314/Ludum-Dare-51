extends VBoxContainer

func _on_NewGameBtn_pressed():
	get_tree().change_scene("res://scn/lvl/Level01.tscn")

func _on_SettingsBtn_pressed():
	get_tree().change_scene("res://scn/UI/Settings.tscn")

func _on_QuitBtn_pressed():
	get_tree().quit()
