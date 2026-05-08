extends Panel

signal Drag_Item(from_holder, to_holder)

@onready var m_function_ui : My_Function_UI = My_Function_UI.new()
@onready var item_information_popup := preload("res://Features/InventoryFeature/Items/UI/item_information_popup.tscn")

@onready var icon : TextureRect = $Icon
var item : Item_Data

var index : int


func Item_Holder_Display(item_data: Item_Data):
	icon.texture = item_data.Icon
	var item_information_popup_instance = item_information_popup.instantiate()
	var item_information = get_parent().get_parent().information
	m_function_ui.Hover(icon,item_information_popup_instance,item_data)
	m_function_ui.Left_Click(icon,item_information,item_data)
	item = item_data

func _get_drag_data(at_position):
	if icon.texture == null:
		return
	var preview_texture : TextureRect = TextureRect.new()
	preview_texture.texture = icon.texture
	var preview : Control = Control.new()
	preview.add_child(preview_texture)
	set_drag_preview(preview)
	return self

func _can_drop_data(at_position, data):
	return true
	
func _drop_data(at_position, data):
	var source_holder = data
	# Swap item
	var tmp_item = item
	item = source_holder.item
	source_holder.item = tmp_item
	# Update visual
	icon.texture = item.Icon if item != null else null
	source_holder.icon.texture = source_holder.item.Icon if source_holder.item != null else null
	
	Drag_Item.emit(source_holder,self)
	
