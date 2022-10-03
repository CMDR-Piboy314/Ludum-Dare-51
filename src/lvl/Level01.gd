extends Node2D

func _ready():
	globals.timerActive = true

func _process(_delta):
	if globals.playerHealth <= 0:
		var _trash = get_tree().change_scene("res://scn/UI/deathScreen.tscn")
