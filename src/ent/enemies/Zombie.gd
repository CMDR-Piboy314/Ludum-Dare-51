extends RigidBody2D

signal path_changed(path)

export(float) var max_speed = 0.5
export(int) var max_health = 1
export(int) var max_damage = 7
export(Color) var dead_modulate

var speed = max_speed
var health = max_health
var damage = max_damage

onready var navigation_agent = $NavigationAgent2D

var velocity = Vector2.ZERO

var target

enum dir {
	L,
	R,
	F,
	B
}

var current_dir = dir.F
var dir_name

enum state {
	IDLE,
	WALK
}

var current_state = state.IDLE

func _ready():
	pass

func _process(_dt):
	if target:
		navigation_agent.set_target_location(target.global_position)
	
	if health <= 0:
		damage = 0
		speed = 0
		
		$CollisionShape2D.set_deferred("disabled", true)
		$Hitbox/CollisionShape2D.set_deferred("disabled", true)
		
		$Sprite.modulate = dead_modulate
		
		$AnimationPlayer.play("die_" + dir_name)
	else:
		update_anims()

func _integrate_forces(_state):
	velocity = position.direction_to(navigation_agent.get_next_location())
	
	velocity *= speed
	
	apply_central_impulse(velocity)
	
	navigation_agent.set_velocity(velocity)
	
	rotation_degrees = 0
	
	# Moving left
	if velocity.x < 0:
		current_dir = dir.L
	
	# Moving right
	elif velocity.x > 0:
		current_dir = dir.R
	
	# Moving up
	elif velocity.y > 0:
		current_dir = dir.F
	
	# Moving down
	elif velocity.y < 0:
		current_dir = dir.B
	
	if velocity.y != 0 || velocity.x != 0:
		current_state = state.WALK
	else:
		current_state = state.IDLE

func set_anim(name, dir):
	if name == "idle":
		$AnimationPlayer.play("RESET")
		$AnimationPlayer.play("walk" + '_' + dir)
		$AnimationPlayer.stop()
	else:
		$AnimationPlayer.play(name + '_' + dir)

func update_anims():
	var anim_name = ""
	dir_name = ""
	
	if current_state == state.WALK:
		anim_name = "walk"
	elif current_state == state.IDLE:
		anim_name = "idle"
	
	if current_dir == dir.F:
		dir_name = "f"
	elif current_dir == dir.B:
		dir_name = "b"
	elif current_dir == dir.L:
		dir_name = "l"
	elif current_dir == dir.R:
		dir_name = "r"
	
	set_anim(anim_name, dir_name)


func _on_DangerZone_body_entered(body):
	if body.is_in_group("Player"):
		target = body

func _on_DangerZone_body_exited(body):
	if health > 0:
		if body.is_in_group("Player"):
			target = null


func _on_NavigationAgent2D_path_changed():
	emit_signal("path_changed", navigation_agent.get_nav_path())

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = safe_velocity
	
	emit_signal("path_changed", [])


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		globals.playerHealth -= damage


func _on_AnimationPlayer_animation_finished(anim_name):
	if "die" in anim_name:
		call_deferred("queue_free")
