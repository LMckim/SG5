extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var walk_speed = 50
export var run_mod = 1.5
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	
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
