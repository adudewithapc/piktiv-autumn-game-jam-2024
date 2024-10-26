class_name PropSpawner
extends Marker2D

@export var propCollection = []

func spawn_prop():
	var prop = propCollection.pick_random().instantiate()
	prop.global_position = global_position
	prop.rotation = rotation
	get_tree().root.add_child(prop)
