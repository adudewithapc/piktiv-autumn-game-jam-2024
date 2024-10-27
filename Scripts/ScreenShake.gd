extends Node

@export var stage: Marker2D
@export var add_trauma = 10
@export var decay := 0.8
@export var max_offset = Vector2(32, 16)

@onready var audio: AudioStreamPlayer2D = $AudioPlayer
@export var clip = []

var trauma_pwr := 3
var trauma := 0.0
var isRotating := false

func shake(add):
	trauma = min(trauma + add, 1.0)

func _on_timer_timeout() -> void:
	shake(add_trauma)
	isRotating = !isRotating
	audio.stream = clip[0] if isRotating else clip[1]
	audio.play()

func _ready():
	Events.shake_screen.connect(shake)

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