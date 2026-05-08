extends Node
class_name Menu_Change

func Button_Menu_Change(button_array : Array[Button], menu_array :Array[Control] ):
	for menu in menu_array.size():
		button_array[menu].pressed.connect(Menu_Invisible.bind(menu_array))
		button_array[menu].pressed.connect(Menu_Changed.bind(menu_array[menu]))

func Menu_Invisible(menu_array : Array):
	for menu_node in menu_array:
		menu_node.visible = false
		
func Menu_Changed(menu : Control):
	menu.visible = true
