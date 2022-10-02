extends RigidBody2D

signal path_changed(path)

export(float) var max_speed = 0.5
export(int) var max_health = 10
export(int) var max_damage = 10
export(Color) var dead_colour

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

enum state {
	IDLE,
	WALK
}

var current_state = state.IDLE

func _ready():
	pass

func _process(_dt):
	update_anims()
	
	if target:
		navigation_agent.set_target_location(target.global_position)

func _integrate_forces(_state):
	velocity = position.direction_to(navigation_agent.get_next_location())
	
	velocity *= speed
	
	apply_central_impulse(velocity)
	
	navigation_agent.set_velocity(velocity)
	
	if health > 0:
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
	var dir_name = ""
	
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
	if body.is_in_group("Player"):
		target = null


func _on_NavigationAgent2D_path_changed():
	emit_signal("path_changed", navigation_agent.get_nav_path())

func _on_NavigationAgent2D_velocity_computed(safe_velocity):
	velocity = safe_velocity
	
	emit_signal("path_changed", [])


func _on_Hitbox_area_entered(area):
	if area.is_in_group("Player"):
		health -= target.hit_damage
		
		if health < 1:
			globals.playerHealth -= (damage * 3)
			damage = 0
			$CollisionShape2D.set_deferred("disabled", true)
			$Sprite.modulate = dead_colour
		else:
			$CollisionShape2D.set_deferred("disabled", false)
		
		target.health -= (damage)
