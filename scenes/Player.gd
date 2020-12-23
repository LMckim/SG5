extends KinematicBody2D

export var walk_speed = 50
export var run_mod = 1.5

export var bound = 0

func _physics_process(delta):
	if bound: return
	var speed = walk_speed
	var vec  = Vector2()
	if Input.is_action_pressed("shift"): speed *= run_mod
	if Input.is_action_pressed("ui_up"):
		vec.y -= speed * delta
		$Walk_Anim.play("move_up")
	elif Input.is_action_pressed("ui_down"):
		vec.y += speed * delta
		$Walk_Anim.play("move_down")
	elif Input.is_action_pressed("ui_left"):
		vec.x -= speed * delta
		$Walk_Anim.play("move_left")
	elif Input.is_action_pressed("ui_right"):
		vec.x += speed * delta
		$Walk_Anim.play("move_right")
	else:
		$Walk_Anim.frame = 0
		$Walk_Anim.stop()
		
	if move_and_collide(vec):
		$Walk_Anim.frame = 0
		$Walk_Anim.stop()


func bind(value:bool):
	bound = value
	print("Bound")


