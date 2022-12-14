extends Node

func _process(_delta):
	if globals.eventNeeded:
		randomize()
		var random = randi() % 7
		
		if random == 0:
			globals.invertCamera = !globals.invertCamera
			globals.invertControls = false

		if random == 1 or random == 2:
			globals.invertControls = !globals.invertControls
			globals.invertCamera = false

		if random == 3 or random == 4:
			globals.spawnPoint_enemyType = globals.enemyTypes.GHOST
			globals.spawnPoint_spawn = true

		if random == 5 or random == 6:
			globals.spawnPoint_enemyType = globals.enemyTypes.ZOMBIE
			globals.spawnPoint_spawn = true
		
		globals.eventNeeded = false

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
