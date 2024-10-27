class_name ReactiveExplosion
extends RigidBody2D

func _exit_tree():
	Events.explode.emit(position)
	