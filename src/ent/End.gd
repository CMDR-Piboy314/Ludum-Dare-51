extends Area2D

# TODO: Write end function (Alex)
# It should save your time, bring you back to level select etc.
func end():
	pass

func _on_End_area_entered(area):
	if area.is_in_group("Player"):
		end()
