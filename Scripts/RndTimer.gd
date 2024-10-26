extends Timer

var maxTime = 20
var minTime = 5


func _on_timeout() -> void:
	wait_time = randf_range(minTime, maxTime)
