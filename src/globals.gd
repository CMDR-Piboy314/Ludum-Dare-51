extends Node

var isPaused = false

var eventNeeded = false

var timerActive = false

var invertControls = false

var invertCamera = false

var playerHealth = 100
var playerIsHovering = false
var playerPos

var itemWasUsed = false

enum inventoryItems {
	NONE,
	KEY_YELLOW,
	KEY_RED,
	KEY_PURPLE,
	KEY_GREEN,
	KEY_ORANGE,
	PISTOL
}

var key_scn = preload("res://scn/ent/Key.tscn")
var pistol_scn = preload("res://scn/ent/Pistol.tscn")

var playerInventory
var lastPlayerInventory

enum enemyTypes {
	GHOST,
	ZOMBIE
}

var spawnPoint_enemyType = enemyTypes.GHOST
var spawnPoint_spawn = false

var currentScore = 0
var highScore = 0

func _process(_dt):
	if itemWasUsed == true:
		return
	
	if lastPlayerInventory != playerInventory:
		if lastPlayerInventory == inventoryItems.KEY_YELLOW:
			var key_inst = key_scn.instance()
			
			key_inst.colour = key_inst.colours.YELLOW
			key_inst.global_position = playerPos
			
			get_tree().get_root().add_child(key_inst)
		
		elif lastPlayerInventory == inventoryItems.KEY_RED:
			var key_inst = key_scn.instance()
			
			key_inst.colour = key_inst.colours.RED
			key_inst.global_position = playerPos
			
			get_tree().get_root().add_child(key_inst)
		
		elif lastPlayerInventory == inventoryItems.KEY_PURPLE:
			var key_inst = key_scn.instance()
			
			key_inst.colour = key_inst.colours.PURPLE
			key_inst.global_position = playerPos
			
			get_tree().get_root().add_child(key_inst)
		
		elif lastPlayerInventory == inventoryItems.KEY_ORANGE:
			var key_inst = key_scn.instance()
			
			key_inst.colour = key_inst.colours.ORANGE
			key_inst.global_position = playerPos
			
			get_tree().get_root().add_child(key_inst)
		
		elif lastPlayerInventory == inventoryItems.KEY_GREEN:
			var key_inst = key_scn.instance()
			
			key_inst.colour = key_inst.colours.GREEN
			key_inst.global_position = playerPos
			
			get_tree().get_root().add_child(key_inst)
		
		elif lastPlayerInventory == inventoryItems.PISTOL:
			var pistol_inst = pistol_scn.instance()
			
			pistol_inst.global_position = playerPos
			
			get_tree().get_root().add_child(pistol_inst)
	
	lastPlayerInventory = playerInventory
	
	itemWasUsed = false
