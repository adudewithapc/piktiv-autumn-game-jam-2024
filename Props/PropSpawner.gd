class_name PropSpawner
extends Timer

@export var propCollection = []

func _ready() -> void:
    timeout.connect(spawn_prop)

func spawn_prop():
    var prop = propCollection.pick_random().instantiate()
    prop.position = get_parent().position
    get_tree().root.add_child(prop)
