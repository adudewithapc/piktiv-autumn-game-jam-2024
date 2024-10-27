class_name GlobalPropsLib
extends Resource

@export var library: Dictionary = {}


func get_all_props() -> Array[PackedScene]:
	return library.keys()

## Returns Random Weighted Prop
func get_prop() -> PackedScene:
	var sum := sum_array(library.values())
	var rnd := randi_range(0, sum)
	for item in library:
		if rnd < item.value:
			return item.key
		rnd -= item.value
	return

func sum_array(arr: Array) -> int:
	var s := 0
	for v in arr:
		s += v
	return s