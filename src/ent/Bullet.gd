extends Area2D

export(int) var damage = 10
export(int) var speed = 200

func _physics_process(dt):
	if rotation_degrees == 0:
		position.x += speed * dt
	elif rotation_degrees == 180:
		position.x -= speed * dt
	elif rotation_degrees == 90:
		position.y += speed * dt
	elif rotation_degrees == -90:
		position.y -= speed * dt

func _on_Bullet_area_entered(area):
	if area.is_in_group("Enemies"):
		area.get_parent().health -= damage
		
		call_deferred("queue_free")

func _on_Bullet_body_entered(body):
	if body.is_in_group("Player"):
		return
	
	call_deferred("queue_free")
