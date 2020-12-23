extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var bindable = true
var ready_to_bind = false
var bound = false
var parent = 0

var bound_player = 0

func _ready():
	parent = get_parent()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not bound and Input.is_action_just_pressed("interact_bind") and ready_to_bind:
		bound = true
		bound_player.bound = true
	elif bound and Input.is_action_just_pressed("interact_bind"):
		bound = false
		bound_player.bound = false
		
	if bound:
		pass
		


func _on_Console_body_entered(body):
	if body.name != "Player": return
	elif bindable: 
		ready_to_bind = true
		bound_player = body
		print("ready")

func _on_Console_body_exited(body):
	if body.name != "Player": return
	elif bindable and ready_to_bind == true: 
		ready_to_bind = false
		bound_player = 0
