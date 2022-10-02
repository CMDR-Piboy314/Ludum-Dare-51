extends Area2D

export(int) var damage = 10
export(int) var speed = 10

func _physics_process(dt):
	if rotation_degrees == 0:
		position.x += speed
	elif rotation_degrees == 180:
		position.x -= speed
	elif rotation_degrees == 90:
		position.y += speed
	elif rotation_degrees == -90:
		position.y -= speed
	else:
		print("goofy ahh")

func _on_Bullet_area_entered(area):
	if area.is_in_group("Enemies"):
		area.get_parent().health -= damage
		
		call_deferred("queue_free")
