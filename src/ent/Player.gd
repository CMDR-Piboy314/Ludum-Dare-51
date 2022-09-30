extends KinematicBody2D

export(int) var max_speed = 50

var velocity = Vector2.ZERO

var speed = max_speed

var both_axes

enum dir {
	L,
	R,
	F,
	B
}

var current_dir = dir.F
var anim_dir = dir.F
var anim_dir_str = "f"

func _ready():
	pass

func _physics_process(_dt):
	handle_input()
	
	velocity = move_and_slide(velocity)

func _process(_dt):
	pass

func handle_input():
	velocity = Vector2.ZERO
	
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
	
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
