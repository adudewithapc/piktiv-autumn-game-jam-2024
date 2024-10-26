extends Marker2D

var rotationDegrees = 0
@export var rotationIncrease = 0.02
@export var maxRotationDegrees = 5
   
func _process(delta: float ) -> void:
	var newRotation = rotationDegrees + delta * rotationIncrease
	rotationDegrees = minf(newRotation, maxRotationDegrees)
	rotate(deg_to_rad(rotationDegrees))
 
