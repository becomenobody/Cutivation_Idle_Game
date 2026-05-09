extends Control

var equipment_list_equiped : Dictionary[int,Equipment_Data]

func Check_Part_Equipment(equipment_data : Equipment_Data):
	print(equipment_data.Equipment_Type.keys()[equipment_data.Equipment])
	
