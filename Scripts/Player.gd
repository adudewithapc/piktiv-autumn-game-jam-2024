extends RigidBody2D

@export var jump_height : float = 1
@export var down_spawn_offset : float

@onready var ground_raycast := $GroundRaycast
@onready var item_spawner := $SpawnPosition

var horizontal_velocity := 0.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if is_on_ground():
			jump()
		else:
			item_spawner.spawn_prop()
	
	update_horizontal_velocity()

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT * horizontal_velocity * 100 * delta)
	pass

func jump():	
	apply_impulse(-transform.y * jump_height)

func is_on_ground() -> bool:
	return ground_raycast.is_colliding()
	
func update_horizontal_velocity():
	horizontal_velocity = Input.get_axis("first_move_left", "first_move_right")
