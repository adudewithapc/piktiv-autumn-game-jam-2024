class_name TimerLabel
extends Label

@export var timer: Timer
@export var decimals: int = 1

func _process(_delta: float) -> void:
	if !timer:
		return
	if (decimals == 0):
		text = str(floor(timer.time_left))
	else:
		text = "%.*f" % [decimals, timer.time_left]