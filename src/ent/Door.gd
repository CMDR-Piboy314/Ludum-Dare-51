tool
extends Sprite

var opened = false

enum colours {
	YELLOW,
	RED,
	PURPLE,
	GREEN,
	ORANGE
}

export(colours) var colour = colours.YELLOW

func _process(_dt):
	match colour:
		colours.YELLOW:
			frame = 0
		colours.RED:
			frame = 1
		colours.PURPLE:
			frame = 2
		colours.GREEN:
			frame = 3
		colours.ORANGE:
			frame = 4
