extends Slot_Holder


var index : int
var slot_type := 0 # Inventory


func Click_Item_Display(item_data: Item_Data):
	var item_information = get_parent().get_parent().information
	m_function_ui.Left_Click(icon,item_information,item_data)



func _can_drop_data(at_position, data):
	return true
	
