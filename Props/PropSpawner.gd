class_name PropSpawner
extends Marker2D

@export var propCollection = []
@onready var timer: Timer = $Timer

func _ready() -> void:
	timer.timeout.connect(spawn_prop)

func spawn_prop():
	var prop = propCollection.pick_random().instantiate()
	prop.position = position
	get_tree().root.add_child(prop)
