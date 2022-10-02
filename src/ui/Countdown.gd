extends Label

var countdown = 10

func _process(delta):
	if globals.timerActive and !globals.isPaused:
		countdown -= delta
		
		if (countdown <= 1):
			globals.eventNeeded = true
			countdown = 10 + countdown
		
		var displayTime = "%02d" % [fmod(countdown, 60)]
		text = "Next event: " + displayTime



# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
