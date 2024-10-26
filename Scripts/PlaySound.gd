extends AudioStreamPlayer2D

@export var local_lib = []
@export var global_lib: Resource

#var collection = local_lib.append_array(global_lib.get_sounds())

func _ready():
	if autoplay:
		#stream = collection.pick_random()
		play()
		pass