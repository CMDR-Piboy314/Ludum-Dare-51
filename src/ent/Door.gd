tool
extends Area2D

var opened = false
var last_opened = opened

enum colours {
	YELLOW,
	RED,
	PURPLE,
	GREEN,
	ORANGE
}

export(colours) var colour = colours.YELLOW

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
	
