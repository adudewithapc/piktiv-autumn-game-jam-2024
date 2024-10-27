extends AudioStreamPlayer2D

func _on_victory_screen_visibility_changed() -> void:
	if is_inside_tree():
		play()
