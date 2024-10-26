extends Node

@export var stage: Marker2D
@export var add_trauma = 10
@export var decay := 0.8
@export var max_offset = Vector2(32, 16)

var trauma_pwr := 3
var trauma := 0.0

func _on_timer_timeout() -> void:
	trauma = min(trauma + add_trauma, 1.0)

func _process(delta: float):
	if trauma:
		trauma = max(trauma - decay * delta, 0)
		_shake()
	elif stage.position.x != 0 or stage.position.y != 0 or stage.rotation != 0:
		lerp(stage.position.x, 0.0, 1)
		lerp(stage.position.y, 0.0, 1)

func _shake():
	var amt = pow(trauma, trauma_pwr)
	stage.position.x = max_offset.x * amt * randf()
	stage.position.y = max_offset.y * amt * randf()