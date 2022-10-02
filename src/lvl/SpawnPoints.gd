extends Node2D

export(PackedScene) var ghost_scene

var rand = RandomNumberGenerator.new()

func spawn(enemyType):
	rand.randomize()
	
	var point = rand.randi_range(0, (get_child_count() - 1))
	var spawn_pos = get_child(point).global_position
	
	match enemyType:
		globals.enemyTypes.GHOST:
			var ghost_inst = ghost_scene.instance()
			
			ghost_inst.global_position = spawn_pos
			
			get_node("%YSort").add_child(ghost_inst)

func _process(_dt):
	if globals.spawnPoint_spawn == true:
		spawn(globals.spawnPoint_enemyType)
		
		globals.spawnPoint_spawn = false
