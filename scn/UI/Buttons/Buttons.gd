extends VBoxContainer

export(PackedScene) onready var play_scn
export(PackedScene) onready var stng_scn

func _on_PlayBtn_pressed():
	var _trash = get_tree().change_scene_to(play_scn)

func _on_SettingsBtn_pressed():
	var _trash = get_tree().change_scene_to(stng_scn)

func _on_QuitBtn_pressed():
	get_tree().quit()
