extends RigidBody2D


func _on_timer_timeout() -> void:
	print("explode")
	queue_free()
