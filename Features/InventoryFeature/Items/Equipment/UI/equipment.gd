extends Control

@onready var hat_equippment := %Hat
@onready var armor_equipment := %Armor
@onready var boot_equipment := %Boot
@onready var weapon_equipment := %Weapon
@onready var ring_equipment := %Ring
@onready var necklace_equipment := %Necklace

var equipment_connection : Array
var equipment_list_equiped : Dictionary[Slot_Holder,Equipment_Data]


func _ready():
	equipment_connection = [hat_equippment,armor_equipment,boot_equipment,\
	weapon_equipment,ring_equipment,necklace_equipment]
	equipment_list_equiped = {
		hat_equippment : null,
		armor_equipment : null,
		boot_equipment : null,
		weapon_equipment : null,
		ring_equipment : null,
		necklace_equipment : null
	}

func Equipment_Equiped_Display(equipment_slot: Slot_Holder,equipment_data : Equipment_Data):
	equipment_slot.Item_Holder_Display(equipment_data)
	equipment_slot.Click_Item_Display(equipment_data)
