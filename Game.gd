extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var zoom_speed = 0.05
export var zoom_in_limit = 0.5
export var zoom_out_limit = 1.5
export var ship_view_limit = 1.3
var current_zoom = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP and current_zoom > zoom_in_limit:
			$ship/Player/Cam.zoom -= Vector2(zoom_speed, zoom_speed)
			current_zoom -= 0.1
		elif event.button_index == BUTTON_WHEEL_DOWN and current_zoom < zoom_out_limit:
			$ship/Player/Cam.zoom += Vector2(zoom_speed, zoom_speed)
			current_zoom += 0.1
			
		if current_zoom >= ship_view_limit:
			$ship/graphic.show()
		else:
			$ship/graphic.hide()
			
			
func _process(delta):
	$ship.position.y -= 15 * delta
	pass

