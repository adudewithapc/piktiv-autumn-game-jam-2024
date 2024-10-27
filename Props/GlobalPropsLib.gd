class_name GlobalPropsLib
extends Resource

@export var library: Array[Array]


func get_all_props() -> Array:
	return grab_from_nest(0, library)

## Returns Random Weighted Prop
func get_prop() -> PackedScene:
	var sum := sum_array(grab_from_nest(1, library))
	var rnd := randi_range(0, sum)
	for pair: Array in library:
		if rnd < pair[1]:
			return pair[0]
		rnd -= pair[1]
	push_error("COULDN'T GRAB RANDOM PROP")
	return null

func sum_array(arr: Array) -> int:
	var s := 0
	for v in arr:
		s += v
	return s

func grab_from_nest(index: int, nest: Array[Array]) -> Array:
	var result = []
	for arr in nest:
		result.append(arr[index])
	return result

