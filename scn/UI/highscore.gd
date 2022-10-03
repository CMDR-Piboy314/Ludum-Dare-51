extends Label


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	if globals.currentScore > globals.highScore:
		globals.highScore = globals.currentScore
		var display = "NEW High Score: " + globals.highScore
		text = display
	else:
		var display = "    High Score: " + globals.highScore
		text = display
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
