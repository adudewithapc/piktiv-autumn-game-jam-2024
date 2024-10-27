class_name GlobalPropsLib
extends Resource

@export var library: Dictionary = {}


func get_all_props() -> Array:
	return library.keys()

## Returns Random Weighted Prop
func get_prop() -> PackedScene:
	var sum := sum_array(library.values())
	var rnd := randi_range(0, sum)
	for key: PackedScene in library:
		if rnd < library[key]:
			return key
		rnd -= library[key]

	push_error("COULDN'T GRAB RANDOM PROP")
	return null

func sum_array(arr: Array) -> int:
	var s := 0
	for v in arr:
		s += v
	return s
