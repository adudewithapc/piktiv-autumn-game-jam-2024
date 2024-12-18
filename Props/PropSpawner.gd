class_name PropSpawner
extends Marker2D

@export var global_lib: GlobalPropsLib = null

func spawn_prop(impulse = Vector2.ZERO):
	var chosenPropType: PackedScene = global_lib.get_prop()
	var prop = chosenPropType.instantiate()
	prop.global_position = global_position
	prop.rotation = rotation
	get_tree().root.get_node("/root/Level").add_child(prop)
	prop.apply_impulse(impulse)
