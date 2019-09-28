extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$background.color = Color(colorPalette.colors[0])
	$image.modulate = Color(colorPalette.colors[4])
	pass # Replace with function body.
