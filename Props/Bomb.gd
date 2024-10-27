extends RigidBody2D

func _ready():
	$ExplodeTimer.timeout.connect(func(): Events.shake_screen.emit(10))

func _on_timer_timeout() -> void:
	Events.explode.emit(position)
	queue_free()