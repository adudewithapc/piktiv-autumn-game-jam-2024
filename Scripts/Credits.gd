extends Control

@export var main_menu : PackedScene

func _on_back_button_pressed() -> void:
	get_tree().change_scene_to_packed(main_menu)
