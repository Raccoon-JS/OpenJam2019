extends Node

var plat = preload("res://scenes/characters/falling_platform.tscn")

func _ready():
	$AnimationPlayer.play("moving_background")
	pass # Replace with function body.

func _process(_delta):
	if $platforms.get_child_count() < 12:
		var p = plat.instance()
		p.position = $spwaner.position
		$platforms.add_child(p)
	pass
