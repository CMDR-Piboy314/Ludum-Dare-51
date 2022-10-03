extends Node

var isPaused = false

var eventNeeded = false

var timerActive = false

var invertControls = false

var invertCamera = false

var playerHealth = 100
var playerIsHovering = false

enum inventoryItems {
	NONE,
	KEY_YELLOW,
	KEY_RED,
	KEY_PURPLE,
	KEY_GREEN,
	KEY_ORANGE,
	PISTOL
}

var playerInventory = inventoryItems.PISTOL

enum enemyTypes {
	GHOST,
	ZOMBIE
}

var spawnPoint_enemyType = enemyTypes.GHOST
var spawnPoint_spawn = false

var currentScore = 0
var highScore = 0
