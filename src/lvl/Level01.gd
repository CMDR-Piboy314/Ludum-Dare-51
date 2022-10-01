extends Node2D

onready var line = $Line2D

func _on_Ghost01_path_changed(path):
	line.points = path
