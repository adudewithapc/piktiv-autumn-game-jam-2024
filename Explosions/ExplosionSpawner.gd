class_name ExplosionSpawner
extends Node

var explosionScene = preload("res://Explosions/Explosion.tscn")
var audioScene = preload("res://Explosions/ExplosionSFX.tscn")

func _ready():
	Events.explode.connect(spawn)

func spawn(position):
	Events.shake_screen.emit(10)
	var explosion: Node2D = explosionScene.instantiate()
	explosion.position = position
	get_parent().add_child.call_deferred(explosion)
	
	var audioPlayer: Node2D = audioScene.instantiate()
	audioPlayer.position = position
	get_parent().add_child.call_deferred(audioPlayer)