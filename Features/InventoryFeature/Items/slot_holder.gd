extends Control
class_name Slot_Holder

signal Drag_Item(from_holder, to_holder)


enum Slot_Type {
	INVENTORY,
	EQUIPMENT
}

@onready var m_function_ui : My_Function_UI = My_Function_UI.new()
@onready var item_information_popup := preload("res://Features/InventoryFeature/Items/UI/item_information_popup.tscn")

@onready var icon : TextureRect = $Icon

var item : Item_Data

func Item_Holder_Display(item_data: Item_Data):
	icon.texture = item_data.Icon
	var item_information_popup_instance = item_information_popup.instantiate()
	m_function_ui.Hover(icon,item_information_popup_instance,item_data)
	#m_function_ui.Left_Click(icon,item_information,item_data)
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
	return Slot_Holder

func _drop_data(at_position, data):
	var source_holder = data
	Drag_Item.emit(source_holder,self)
