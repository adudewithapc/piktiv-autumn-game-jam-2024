class_name Explosion
extends Node2D

func _ready():
	print("Boom!")

func _on_animated_sprite_2d_animation_finished() -> void:
	queue_free()

func _on_area_2d_body_shape_entered(_body_rid: RID, body: Node2D, _body_shape_index: int, _local_shape_index: int) -> void:
	if body is Player:
		body.died.emit(Player.DEATH_SOURCE.EXPLODED)
	if body is not Explosion:
		body.queue_free()
