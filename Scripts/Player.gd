class_name Player
extends RigidBody2D

enum DEATH_SOURCE { CRUSH, EXPLODED }

signal died(death_source: DEATH_SOURCE)

@export var input_prefix : String
@export var jump_height : float = 1
@export var down_spawn_offset : float
@export var speed : float = 100
@export var stand_up_force : float = 100
@export var prop_timer: float = .5
@export var stun_modulate : Color = Color.WHITE

@onready var ground_raycast := $GroundRaycast
@onready var item_spawner := $PropSpawner
@onready var stun_timer := $StunTimer

var horizontal_velocity := 0.0
var prop_time := 0.0
var start_modulate_color : Color

func _ready() -> void:
	contact_monitor = true
	max_contacts_reported = 20
	start_modulate_color = modulate

func _process(delta: float) -> void:
	prop_time = max(0, prop_time - delta)

	if not is_stunned():
		process_input()
	else:
		horizontal_velocity = 0

func process_input():
	if Input.is_action_just_pressed(input_prefix + "_jump"):
		if is_on_ground():
			prop_time = 0
			jump()
		elif prop_time <= 0:
			prop_time = prop_timer
			item_spawner.spawn_prop(transform.basis_xform(Vector2.DOWN) * 1000.)
			jump()
	
	update_horizontal_velocity()

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
	if abs(rotation) > 0.5:
		angular_velocity = -rotation * delta * stand_up_force

func is_moving() -> bool:
	return abs(horizontal_velocity) + linear_velocity.length() > 0.1

func _on_surrounded() -> void:
	died.emit(DEATH_SOURCE.CRUSH)
	queue_free()

func is_stunned() -> bool:
	return not stun_timer.is_stopped()

func _on_body_entered(body: Node) -> void:
	if not body is RigidBody2D:
		return
	
	if body.linear_velocity.length() > 1000:
		stun_timer.start()
		modulate = stun_modulate

func _on_stun_timer_timeout() -> void:
	stun_timer.stop()
	modulate = start_modulate_color
