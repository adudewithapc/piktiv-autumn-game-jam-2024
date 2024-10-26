extends ShapeCast2D

signal surrounded

@export var ray_length := 50.0
@export var trip_frequency := 1

var has_missed_this_trip := false
var time := 0.0

func _physics_process(delta: float) -> void:
	time += delta * 2 * PI * trip_frequency
	target_position = Vector2(cos(time), sin(time)) * ray_length
	
	print(cos(time))
	if cos(time) >= 0.95 and cos(time - delta) < 0.95 and time > 0:
		surrounded.emit()
	
	if not is_colliding() and not has_missed_this_trip:
		time = 0
