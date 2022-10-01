extends Button

export(PackedScene) var target_scn

func _on_PlayBtn_pressed():
	get_tree().call_deferred("change_scene_to", target_scn)
