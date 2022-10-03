extends Area2D

# TODO: Write end function (Alex)
# It should save your time, bring you back to level select etc.
func end():
	globals.playerHealth = 100
	globals.playerInventory = globals.inventoryItems.PISTOL
	var _trash = get_tree().change_scene("res://scn/UI/levelSelect.tscn")
	pass

func _on_End_area_entered(area):
	if area.is_in_group("Player"):
		end()
