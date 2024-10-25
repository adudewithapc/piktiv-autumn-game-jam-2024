extends RigidBody2D

@export var jump_height : float = 1

@onready var ground_raycast := $GroundRaycast

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump") and ground_raycast.is_colliding():
		apply_impulse(Vector2.UP * jump_height)
