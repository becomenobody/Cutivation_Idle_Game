extends Control

@onready var container : VBoxContainer = $Panel/Container
@onready var panel : Panel = $Panel

@onready var item_name : Label = %Item_Name
@onready var item_type : Label = %Item_Type
@onready var item_usage : Label = %Item_Usage


func Popup_Information_Display(item_data : Item_Data):
	item_name.text = "%s" %item_data.Name
	item_usage.text = "%s" %item_data.Usage
	await get_tree().process_frame
	panel.size = container.size
	self.z_index = 10
