class_name PlayRNDSound
extends AudioStreamPlayer2D

@export var global_lib: Resource
@export var local_lib = []

@export_range(0, 4) var pitch_min = .2
@export_range(0, 4) var pitch_max = 1.8

var collection = []

func _ready():
	collection.append_array(local_lib)
	collection.append_array(global_lib.get_sounds())
	if autoplay:
		play_rnd()

func play_rnd():
	stream = collection.pick_random()
	pitch_scale = randf_range(pitch_min, pitch_max)
	play()