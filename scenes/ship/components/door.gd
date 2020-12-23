extends Area2D

export var slide_speed = 3
export var slide_max = 100
export var locked = false

enum state {OPEN, OPENING, CLOSED, CLOSING}

var sliding = false
var slide_dist = 0
var occupied = false
var curr_state = state.CLOSED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_dist = slide_speed * delta
	if move_dist + slide_dist > slide_max:
		move_dist = slide_max - slide_dist
	
	if curr_state == state.OPENING:
		$Door_Body.position.y -= move_dist	
		slide_dist += move_dist
	if curr_state == state.CLOSING:
		$Door_Body.position.y += move_dist	
		slide_dist += move_dist
		
	if slide_dist == slide_max:
		curr_state = state.OPEN if curr_state == state.OPENING else state.CLOSED
		slide_dist = 0
		
	if not occupied and curr_state == state.OPEN:
		curr_state = state.CLOSING
			
			
func _on_Sliding_Door_body_entered(body):
	if body.name != "Player": return
	
	occupied = true
	if curr_state == state.CLOSED or curr_state == state.CLOSING:
		curr_state = state.OPENING

func _on_Sliding_Door_body_exited(body):
	if body.name != "Player": return
	
	occupied = false
	if curr_state == state.OPEN or curr_state == state.CLOSED:
		curr_state = state.CLOSING
