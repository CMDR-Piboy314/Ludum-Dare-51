tool
extends StaticBody2D

var opened = false
var last_opened = opened

var check_input = false

enum colours {
	YELLOW,
	RED,
	PURPLE,
	GREEN,
	ORANGE
}

export(colours) var colour = colours.YELLOW

func _input(_event):
	if check_input == true:
		if Input.is_action_pressed("shoot"):
			match colour:
				colours.YELLOW:
					if globals.playerInventory != globals.inventoryItems.KEY_YELLOW:
						pass
				
				colours.RED:
					if globals.playerInventory != globals.inventoryItems.KEY_RED:
						pass
				
				colours.PURPLE:
					if globals.playerInventory != globals.inventoryItems.KEY_PURPLE:
						pass
				
				colours.GREEN:
					if globals.playerInventory != globals.inventoryItems.KEY_GREEN:
						pass
				
				colours.ORANGE:
					if globals.playerInventory != globals.inventoryItems.KEY_ORANGE:
						pass
			
			opened = true
			
			globals.playerInventory = globals.inventoryItems.NONE

func _process(_dt):
	if Engine.editor_hint:
		match colour:
			colours.YELLOW:
				$Sprite.frame = 0
			colours.RED:
				$Sprite.frame = 1
			colours.PURPLE:
				$Sprite.frame = 2
			colours.GREEN:
				$Sprite.frame = 3
			colours.ORANGE:
				$Sprite.frame = 4
	else:
		if last_opened == false:
			if opened == true:
				$Sprite.frame = 5
				$CollisionShape2D.disabled = true
		
		else:
			if opened == false:
				match colour:
					colours.YELLOW:
						$Sprite.frame = 0
					colours.RED:
						$Sprite.frame = 1
					colours.PURPLE:
						$Sprite.frame = 2
					colours.GREEN:
						$Sprite.frame = 3
					colours.ORANGE:
						$Sprite.frame = 4
	
	last_opened = opened


func _on_OpenZone_body_entered(body):
	if body.is_in_group("Player") == true:
		check_input = true

func _on_OpenZone_body_exited(body):
	if body.is_in_group("Player") == true:
		check_input = false
