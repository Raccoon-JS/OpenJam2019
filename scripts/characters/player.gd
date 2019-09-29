extends KinematicBody2D

export var speed = 500
export var gravity = 50
#export var less_gravity = 20
const max_fall_speed = 1000
export var jump_force = 1000
var velo = Vector2()
var y_velo = 0
"""
const jump_buffer = 0.08
var time_pressed_jump = 0.0
var time_left_ground = 0.0
var last_grounded = false
"""
var facing_right = true

onready var anim_player = $AnimationPlayer


func _physics_process(_delta):
	var move_vec = Vector2()
	
	if Input.is_action_pressed("left"):
		move_vec.x -= 1
	if Input.is_action_pressed("right"):
		move_vec.x += 1
	
	#velo += move_vec * speed - drag * Vector2(velo.x,0)
	move_vec = move_and_slide(Vector2(move_vec.x*speed,y_velo), Vector2(0,-1))
	var cur_grounded = is_on_floor()

	y_velo += gravity
	if cur_grounded and Input.is_action_just_pressed("jump"):
		y_velo = -jump_force
	
	if cur_grounded and y_velo >= 5:
		y_velo = 5
	if y_velo > max_fall_speed:
		y_velo = max_fall_speed
	
	if move_vec.x > 0.0 and !facing_right:
		flip()
	elif move_vec.x < 0.0 and facing_right:
		flip()
	
	if cur_grounded:
		if move_vec == Vector2():
			play_anim("idle")
		else:
			play_anim("movement")
	else:
		if move_vec.y < 0:
			play_anim("jump")
		#else:
		#	play_anim("fall")
	pass

func jump():
	velo.y = -jump_force
	pass

#func get_cur_time():
#	return OS.get_ticks_msec()/1000.0

func flip():
	$Sprite.flip_h = !$Sprite.flip_h
	facing_right = !facing_right
	pass
	
func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)
	pass