extends VBoxContainer

export(PackedScene) onready var play_scn
export(PackedScene) onready var stng_scn

func _on_NewGameBtn_pressed():
	var trash = get_tree().change_scene(play_scn)

func _on_SettingsBtn_pressed():
	var trash = get_tree().change_scene(stng_scn)

func _on_QuitBtn_pressed():
	get_tree().quit()
