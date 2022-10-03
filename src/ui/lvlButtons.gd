extends HBoxContainer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_lvl1Btn_pressed():
	var _trash = get_tree().change_scene("res://scn/lvl/Level01.tscn")
	pass # Replace with function body.


func _on_lvl2Btn_pressed():
	var _trash = get_tree().change_scene("res://scn/lvl/Level02.tscn")
	pass # Replace with function body.


func _on_lvl3Btn_pressed():
	var _trash = get_tree().change_scene("res://scn/lvl/Level03.tscn")
	pass # Replace with function body.


func _on_lvl4Btn_pressed():
	var _trash = get_tree().change_scene("res://scn/lvl/Level04.tscn")
	pass # Replace with function body.


func _on_lvl5Btn_pressed():
	var _trash = get_tree().change_scene("res://scn/lvl/Level00.tscn")
	pass # Replace with function body.
