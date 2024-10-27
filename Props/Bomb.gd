extends RigidBody2D

var explosionScene = preload("res://Scenes/Explosion.tscn")
var audioScene = preload("res://SFX/SoundPlayer.tscn")

func _ready():
	$ExplodeTimer.timeout.connect(func(): Events.shake_screen.emit(10))

func _on_timer_timeout() -> void:
	var explosion = explosionScene.instantiate()
	get_parent().add_child(explosion)
	explosion.position = position
	print(get_parent())
	
	var audioPlayer = audioScene.instantiate()
	get_parent().add_child(audioPlayer)
	audioPlayer.position = position
	
	$RemoveTimer.start()
	

func _on_remove_timer_timeout() -> void:
	queue_free()
