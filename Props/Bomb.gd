extends RigidBody2D

var explosionScene = preload("res://Props/Explosion.tscn")
var audioScene = preload("res://Props/ExplosionSFX.tscn")

func _ready():
	$ExplodeTimer.timeout.connect(func(): Events.shake_screen.emit(10))

func _on_timer_timeout() -> void:
	explode()
	$RemoveTimer.start()
	

func _on_remove_timer_timeout() -> void:
	queue_free()

func explode():
	var explosion = explosionScene.instantiate()
	get_parent().add_child(explosion)
	explosion.position = position
	
	var audioPlayer = audioScene.instantiate()
	get_parent().add_child(audioPlayer)
	audioPlayer.position = position
