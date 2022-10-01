extends Label

var countdown = 10

func _process(delta):
	countdown -= delta
	
	if (countdown <= 1):
		countdown = 10 + countdown
	
	var displayTime = "%02d" % [fmod(countdown, 60)]
	text = displayTime
	
	pass
