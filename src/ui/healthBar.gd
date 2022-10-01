extends TextureProgress

var amount = 0
var demo = true
var negative = false

func _process(delta):
	if demo:
		if !negative:
			amount += 100 * delta
		else:
			amount -= 100 * delta
		if amount > 100:
			amount = 100
			negative = !negative
		if amount < 0:
			amount = 0
			negative = !negative
	self.value = amount

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
