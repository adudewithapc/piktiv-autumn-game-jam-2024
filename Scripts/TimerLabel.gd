extends Label

@export var timer: Timer
@export var decimals: int = 1

func _process(_delta: float) -> void:
	if !timer:
		return
	text = "%.*f" % [decimals, timer.time_left]
