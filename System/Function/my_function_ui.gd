extends Node
class_name My_Function_UI

var ui_base_position: Vector2

func All_Disconnection(ui: Control):
	if ui.mouse_entered.get_connections().size() > 0:
		for c in ui.mouse_entered.get_connections():
			ui.mouse_entered.disconnect(c.callable)

	if ui.mouse_exited.get_connections().size() > 0:
		for c in ui.mouse_exited.get_connections():
			ui.mouse_exited.disconnect(c.callable)

	if ui.gui_input.get_connections().size() > 0:
		for c in ui.gui_input.get_connections():
			ui.gui_input.disconnect(c.callable)

# Hover
func Hover(ui: Control,information_popup: Control,data: Resource):
	ui.mouse_entered.connect(Hover_Object.bind(ui,information_popup,data))
	ui.mouse_exited.connect(Unhover_Object.bind(ui,information_popup))
		
func Hover_Object(ui: Control, information_popup: Control, data: Resource):
	ui_base_position = ui.position
	ui.position.y = ui.position.y + 5
	if information_popup.is_in_group("Popup_Information"):
		if information_popup.get_parent():
			information_popup.get_parent().remove_child(information_popup)

		ui.add_child(information_popup)
		information_popup.Popup_Information_Display(data)
	
func Unhover_Object(ui: Control,information_popup: Control):
	ui.position = ui_base_position
	ui.remove_child(information_popup)
	
# Left Click
func Left_Click(ui: Control,information: Control,data: Resource ):
	ui.gui_input.connect(Left_Click_Object.bind(ui,information,data))
	
func Left_Click_Object(event : InputEvent,ui: Control,information: Control, data: Resource):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		if event.pressed:
			if information.is_in_group("Get_Information"):
				information.Information_Display(data)
	
