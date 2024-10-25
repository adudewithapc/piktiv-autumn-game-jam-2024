extends RigidBody2D

@export var input_prefix : String
@export var jump_height : float = 1
@export var down_spawn_offset : float
@export var speed : float = 100
@export var stand_up_force : float = 100

@onready var ground_raycast := $GroundRaycast
@onready var item_spawner := $SpawnPosition
@onready var stand_still_timer := $StandStillTimer
@onready var timer_text := $VisualTimer

var horizontal_velocity := 0.0

func _process(delta: float) -> void:
	if Input.is_action_just_pressed(input_prefix + "_jump"):
		if is_on_ground():
			jump()
		else:
			item_spawner.spawn_prop()
			jump()
	
	update_horizontal_velocity()
	update_timer()

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2.RIGHT * horizontal_velocity * speed * delta)
	stand_up(delta)
	pass

func jump():
	linear_velocity.y = 0
	var jump_impulse := Vector2.UP * jump_height
	apply_impulse(jump_impulse)

func is_on_ground() -> bool:
	return ground_raycast.is_colliding()
	
func update_horizontal_velocity():
	horizontal_velocity = Input.get_axis(input_prefix + "_move_left", input_prefix + "_move_right")

func stand_up(delta: float):
	if abs(rotation) > 1:
		angular_velocity = -rotation * delta * stand_up_force
	else:
		angular_velocity = 0
		rotation = 0

func is_moving() -> bool:
	return abs(horizontal_velocity) + linear_velocity.length() > 0.1

func update_timer():
	if is_moving():
		stand_still_timer.stop()
		timer_text.text = str(stand_still_timer.wait_time).pad_decimals(2)
	elif stand_still_timer.is_stopped():
		stand_still_timer.start()
	
	if not stand_still_timer.is_stopped():
		update_timer_text()

func update_timer_text():
	timer_text.text = str(stand_still_timer.time_left).pad_decimals(2)

func _on_stand_still_timer_timeout() -> void:
	queue_free()
