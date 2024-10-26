extends RigidBody2D

@export var jump_height : float = 1
@export var down_spawn_offset : float
@export var item : PackedScene

@onready var ground_raycast := $GroundRaycast

var horizontal_velocity := 0.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("jump"):
		if is_on_ground():
			jump()
		else:
			spawn_item()
	
	update_horizontal_velocity()

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT * horizontal_velocity * 100 * delta)
	pass

func jump():	
	apply_impulse(Vector2.UP * jump_height)

func spawn_item():
	var new_item := item.instantiate(PackedScene.GEN_EDIT_STATE_INSTANCE)
	new_item.global_position = global_position + Vector2.DOWN * down_spawn_offset
	get_tree().root.add_child(new_item)

func is_on_ground() -> bool:
	return ground_raycast.is_colliding()
	
func update_horizontal_velocity():
	horizontal_velocity = Input.get_axis("first_move_left", "first_move_right")
