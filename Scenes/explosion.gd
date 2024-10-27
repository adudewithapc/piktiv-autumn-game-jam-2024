extends Node2D

var deletableProps = ["Block2", "Barrel1", "Block1", "Pumpkin1", "Tree1", "Vase1"]

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()

func _on_area_2d_body_shape_entered(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:
	if body is Player:
		body.died.emit(Player.DEATH_SOURCE.EXPLODED)
		body.queue_free()
	if body.name in deletableProps:
		body.queue_free()
