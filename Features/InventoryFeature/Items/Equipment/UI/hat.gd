extends TextureRect



func _can_drop_data(at_position: Vector2, data: Variant) -> bool:
	print("can drop")
	return true
