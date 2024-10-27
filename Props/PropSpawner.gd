class_name PropSpawner
extends Marker2D

@export var propCollection = []
@export var i = 0

func spawn_prop(impulse = Vector2.ZERO):
	i += 2
	var chosenPropType: PackedScene = propCollection.pick_random()
	var prop = chosenPropType.instantiate()
	prop.global_position = global_position
	prop.rotation = rotation
	prop.name = "prop" + str(i)
	get_tree().root.get_child(0).add_child(prop)
	prop.apply_impulse(impulse)
