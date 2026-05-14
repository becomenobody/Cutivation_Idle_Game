extends Slot_Holder


var index : int
var slot_type := 1 # Equipment
var _can_drop : bool = false


func _can_drop_data(at_position, data):
	return true
