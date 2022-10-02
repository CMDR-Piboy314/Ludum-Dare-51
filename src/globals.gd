extends Node

# This controls the player's inverted controls
var invertControls = false

# This controls the inverted camera
var invertCamera = false

var playerHealth = 100

enum inventoryItems {
	KEY_YELLOW,
	KEY_RED,
	KEY_PURPLE,
	KEY_GREEN,
	KEY_ORANGE,
	NONE
}

var playerInventory = inventoryItems.NONE
