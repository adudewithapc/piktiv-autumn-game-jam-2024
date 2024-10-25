extends RigidBody2D

@export var jump_height : float = 1

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		apply_impulse(Vector2.UP * jump_height)
