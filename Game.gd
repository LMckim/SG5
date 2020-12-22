extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var zoom_speed = 0.05
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_WHEEL_UP:
			$Player/Cam.zoom += Vector2(zoom_speed, zoom_speed)
		elif event.button_index == BUTTON_WHEEL_DOWN:
			$Player/Cam.zoom -= Vector2(zoom_speed, zoom_speed)
			
			

