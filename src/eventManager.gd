extends Node

func _process(_delta):
	if globals.eventNeeded:
		randomize()
		var random = randi() % 3
		if random == 0:
			globals.invertCamera = !globals.invertCamera
			globals.invertControls = false
		if random == 1:
			globals.invertControls = !globals.invertControls
			globals.invertCamera = false
		if random == 2:
			pass
		globals.eventNeeded = false
		pass
	pass

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
