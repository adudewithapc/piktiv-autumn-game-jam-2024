extends RigidBody2D

var explosionScene = preload("res://Scenes/Explosion.tscn")

func _on_timer_timeout() -> void:
	var explosion = explosionScene.instantiate()
	get_parent().add_child(explosion)
	explosion.position = position
	$RemoveTimer.start()

func _on_remove_timer_timeout() -> void:
	queue_free()
