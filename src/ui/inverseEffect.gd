extends ColorRect

# TODO: If the globals.invertCamera is true, show the effect, otherwise hide

func _process(_dt):
	if globals.invertCamera == true:
		self.visible = true
	else:
		self.visible = false

#self.visible = false

#hide()

#shader.set_visible(globals.invertCamera)

#$ColorRect.visible = false
