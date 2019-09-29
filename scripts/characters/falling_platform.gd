extends KinematicBody2D

#var velo = Vector2()

func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	position.y += 1
	
	if position.y > 805:
		queue_free()
	
	pass
