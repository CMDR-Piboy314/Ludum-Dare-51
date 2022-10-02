extends CanvasLayer


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false
	globals.isPaused = false
	pass # Replace with function body.

var released = true

func _process(_delta):
	if Input.is_key_pressed(KEY_ESCAPE) and released:
		self.visible = !self.visible
		globals.isPaused = !globals.isPaused
		released = false
	if !Input.is_key_pressed(KEY_ESCAPE):
		released = true
		
	if globals.isPaused == false:
		self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
