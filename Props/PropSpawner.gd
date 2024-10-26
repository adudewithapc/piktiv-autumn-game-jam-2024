class_name PropSpawner
extends Marker2D

@export var propCollection = []

func spawn_prop(impulse = Vector2.ZERO):
	var prop: RigidBody2D = propCollection.pick_random().instantiate()
	prop.global_position = global_position
	prop.rotation = rotation
	get_tree().root.get_child(0).add_child(prop)
	prop.apply_impulse(impulse)
