extends Area2D

var pickable = false

func _input(_event):
	if Input.is_action_pressed("shoot") && pickable == true:
		globals.playerInventory = globals.inventoryItems.PISTOL
		$Sprite.visible = false
		$CollisionShape2D.disabled = true
		$CollectSFX.play()

func _process(_dt):
	if $Sprite.visible == false && $CollectSFX.playing == false:
		call_deferred("queue_free")

func _on_Pistol_area_entered(area):
	if area.is_in_group("Player"):
		globals.playerIsHovering = true
		pickable = true

func _on_Pistol_area_exited(area):
	if area.is_in_group("Player"):
		globals.playerIsHovering = false
		pickable = false
