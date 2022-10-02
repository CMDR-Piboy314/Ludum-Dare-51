extends KinematicBody2D

export(int) var max_speed = 100
export(int) var max_health = 50
export(int) var hit_damage = 10

var speed = max_speed

var velocity = Vector2.ZERO

var both_axes

enum dir {
	L,
	R,
	F,
	B
}

var current_dir = dir.F
var anim_dir = dir.F

enum state {
	IDLE,
	WALK
}

var current_state = state.IDLE

func _ready():
	globals.playerHealth = max_health

func _physics_process(_dt):
	if globals.isPaused:
		speed = 0
	else:
		speed = max_speed

	handle_input()
	
	velocity = move_and_slide(velocity)

func _process(_dt):
	update_anims()

func handle_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		if !globals.invertControls:
			velocity.x += 1
		else:
			velocity.x -= 1
	
	if Input.is_action_pressed("move_left"):
		if !globals.invertControls:
			velocity.x -= 1
		else:
			velocity.x += 1
	
	if Input.is_action_pressed("move_down"):
		if !globals.invertControls:
			velocity.y += 1
		else:
			velocity.y -= 1
	
	if Input.is_action_pressed("move_up"):
		if !globals.invertControls:
			velocity.y -= 1
		else:
			velocity.y += 1
	
	if velocity.x != 0 && velocity.y != 0:
		both_axes = true
	else:
		both_axes = false
	
	if both_axes == true:
		if current_dir == dir.L || current_dir == dir.R:
			velocity.x = 0
		elif current_dir == dir.F || current_dir == dir.B:
			velocity.y = 0
	
	if velocity.x != 0 && velocity.y != 0:
		velocity.x = 0
		velocity.y = 0
	
	if velocity.x != 0 || velocity.y != 0:
		current_state = state.WALK
	else:
		current_state = state.IDLE
	
	if !both_axes:
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
		
		anim_dir = current_dir
	
	else:
		# Moving left
		if velocity.x < 0:
			anim_dir = dir.L
		
		# Moving right
		elif velocity.x > 0:
			anim_dir = dir.R
		
		# Moving up
		elif velocity.y > 0:
			anim_dir = dir.F
		
		# Moving down
		elif velocity.y < 0:
			anim_dir = dir.B
	
	velocity.x *= speed
	velocity.y *= speed

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
	
	if anim_dir == dir.F:
		dir_name = "f"
	elif anim_dir == dir.B:
		dir_name = "b"
	elif anim_dir == dir.L:
		dir_name = "l"
	elif anim_dir == dir.R:
		dir_name = "r"
	
	set_anim(anim_name, dir_name)
