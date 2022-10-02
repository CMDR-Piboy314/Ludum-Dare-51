extends Node

var invertControls = false

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
