extends Node

var isPaused = false

var eventNeeded = false

var timerActive = false

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

enum enemyTypes {
	GHOST,
	ZOMBIE
}
