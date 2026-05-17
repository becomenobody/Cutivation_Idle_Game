extends Control

@onready var hat_equippment := %Hat
@onready var armor_equipment := %Armor
@onready var boot_equipment := %Boot
@onready var weapon_equipment := %Weapon
@onready var ring_equipment := %Ring
@onready var necklace_equipment := %Necklace
@onready var equipment_1 = $BoxContainer/HBoxContainer
@onready var equipment_2 = $BoxContainer/HBoxContainer2



var equipment_connection_1 : Dictionary
var equipment_connection_2 : Dictionary
var equipment_list_equiped : Dictionary[Slot_Holder,Equipment_Data]


func _ready():
	equipment_connection_1 = {hat_equippment: 0,armor_equipment: 1,boot_equipment: 2}
	equipment_connection_2 ={weapon_equipment: 0,ring_equipment: 1,necklace_equipment: 2,
	}
	equipment_list_equiped = {
		hat_equippment : null,
		armor_equipment : null,
		boot_equipment : null,
		weapon_equipment : null,
		ring_equipment : null,
		necklace_equipment : null
	}

func Equipment_Equiped_Display(equipment_slot: Slot_Holder,equipment_data : Equipment_Data):
	var parent = equipment_slot.get_parent()
	if parent == equipment_1:
		parent.remove_child(equipment_slot)
		parent.add_child(equipment_slot)
		parent.move_child(equipment_slot,equipment_connection_1[equipment_slot])
	if parent == equipment_2:
		parent.remove_child(equipment_slot)
		parent.add_child(equipment_slot)
		print(equipment_connection_2[equipment_slot])
		parent.move_child(equipment_slot,equipment_connection_2[equipment_slot])
	equipment_slot.Item_Holder_Display(equipment_data)
	equipment_slot.Click_Item_Display(equipment_data)
