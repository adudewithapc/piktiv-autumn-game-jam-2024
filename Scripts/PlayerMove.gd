extends Sprite2D

@export var speed : float = 1

func _process(delta: float) -> void:
	update_velocity(delta)

func update_velocity(delta: float):
	var velocity := Vector2.ZERO
	
	if Input.is_action_pressed("first_move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("first_move_right"):
		velocity.x += speed
	
	position += velocity * delta
