extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$background.color = Color(colorPalette.colors[0])
	$image.modulate = Color(colorPalette.colors[4])
	$title/panel.color = Color(colorPalette.colors[2])
	$title/words.modulate = Color(colorPalette.colors[3])
	$AnimationPlayer.play("title")
	pass # Replace with function body.