tool

extends Area2D

enum colours {
	YELLOW,
	RED,
	PURPLE,
	GREEN,
	ORANGE
}

export(colours) var colour = colours.YELLOW

var pickable = false

func _input(_event):
	if pickable == true:
		if Input.is_action_pressed("shoot"):
			match colour:
				colours.YELLOW:
					globals.playerInventory = globals.inventoryItems.KEY_YELLOW
				colours.RED:
					globals.playerInventory = globals.inventoryItems.KEY_RED
				colours.PURPLE:
					globals.playerInventory = globals.inventoryItems.KEY_PURPLE
				colours.GREEN:
					globals.playerInventory = globals.inventoryItems.KEY_GREEN
				colours.ORANGE:
					globals.playerInventory = globals.inventoryItems.KEY_ORANGE
			
			call_deferred("queue_free")

func _process(_dt):
	if Engine.editor_hint:
		match colour:
			colours.YELLOW:
				$Sprite.frame = 0
			colours.RED:
				$Sprite.frame = 2
			colours.PURPLE:
				$Sprite.frame = 3
			colours.GREEN:
				$Sprite.frame = 4
			colours.ORANGE:
				$Sprite.frame = 5

func _on_Key_area_entered(body):
	if body.is_in_group("Player"):
		print("hovering")
		globals.playerIsHovering = true
		pickable = true

func _on_Key_area_exited(body):
	if body.is_in_group("Player"):
		globals.playerIsHovering = false
		pickable = false
