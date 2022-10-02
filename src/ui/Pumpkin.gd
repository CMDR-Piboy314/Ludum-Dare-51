extends Sprite



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "default":
		$AnimationPlayer.play("default 2")
