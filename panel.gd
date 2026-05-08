extends Panel


@onready var texture_rect = $TextureRect

func _get_drag_data(at_position):
	if texture_rect.texture == null:
		return
	
	var preview = duplicate()
	set_drag_preview(preview)
	return texture_rect
