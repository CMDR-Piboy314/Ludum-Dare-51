extends TextureRect

func _process(_delta):
	if globals.playerInventory == globals.inventoryItems.NONE:
		self.texture = preload("res://res/img/nothing.png")
		
	if globals.playerInventory == globals.inventoryItems.KEY_YELLOW:
		self.texture = preload("res://icon.png")
		
	if globals.playerInventory == globals.inventoryItems.KEY_RED:
		self.texture = preload("res://icon.png")
		
	if globals.playerInventory == globals.inventoryItems.KEY_PURPLE:
		self.texture = preload("res://icon.png")
		
	if globals.playerInventory == globals.inventoryItems.KEY_GREEN:
		self.texture = preload("res://icon.png")
		
	if globals.playerInventory == globals.inventoryItems.KEY_ORANGE:
		self.texture = preload("res://icon.png")


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
