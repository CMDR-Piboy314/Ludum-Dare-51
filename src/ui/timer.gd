extends Label

var timer = 0

func _process(delta):
	if globals.timerActive and !globals.isPaused:
		timer += delta
		var displayTime = "%02d : %02d : %02d" % [fmod(timer, 60 * 60) / 60, fmod(timer, 60), fmod(timer, 1) * 1000]
		text = displayTime



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
