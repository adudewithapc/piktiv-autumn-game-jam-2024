extends Marker2D

var rotationDegrees = 0
@export var rotationIncrease = 0.02
@export var maxRotationDegrees = 5
var isRotating = false
var rotatingRight = true
   
func _process(delta: float ) -> void:
	if isRotating:
		var sign = 1 if rotatingRight else -1
		var newRotation = rotationDegrees + delta * rotationIncrease * sign 
		rotationDegrees = clampf(newRotation, -maxRotationDegrees, maxRotationDegrees)
		rotate(deg_to_rad(rotationDegrees))

func _on_timer_timeout() -> void:
	isRotating = !isRotating
	rotationDegrees = 0
	if isRotating:
		rotatingRight = !rotatingRight
		
