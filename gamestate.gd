extends Node

var is_paused := true

var ship

func _input(event):
	if event.is_action_pressed("start"):
		_on_start_pressed()
		
func _on_start_pressed():
	is_paused = !is_paused

	if is_paused:
		ship.reset()
