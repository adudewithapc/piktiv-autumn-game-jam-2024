extends Control

func _on_play_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/LevelArt.tscn")

func _on_quit_button_pressed() -> void:
	get_tree().quit()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()
	if event.is_action_pressed("ui_accept"):
		_on_play_button_pressed()
