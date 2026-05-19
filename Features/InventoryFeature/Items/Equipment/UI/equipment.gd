extends Control

signal Equiped_Stat_Signal(attack: int,health: int)

@onready var hat_equipment := %Hat
@onready var armor_equipment := %Armor
@onready var boot_equipment := %Boot
@onready var weapon_equipment := %Weapon
@onready var ring_equipment := %Ring
@onready var necklace_equipment := %Necklace
@onready var equipment_1 = $BoxContainer/HBoxContainer
@onready var equipment_2 = $BoxContainer/HBoxContainer2
@onready var equipment_stat = %Equipment_Stat


var equipment_connection_1 : Dictionary # Equipment Holder : Hat, Armor, Boot
var equipment_connection_2 : Dictionary # Equipment Holde : Weapon, Ring, Necklace
var equipment_list_equiped : Dictionary[Slot_Holder,Equipment_Data]


func _ready():
	equipment_connection_1 = {hat_equipment: 0,armor_equipment: 1,boot_equipment: 2}
	equipment_connection_2 ={weapon_equipment: 0,ring_equipment: 1,necklace_equipment: 2,
	}
	equipment_list_equiped = {
		hat_equipment : null,
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
		parent.move_child(equipment_slot,equipment_connection_2[equipment_slot])
	equipment_slot.Item_Holder_Display(equipment_data)
	equipment_slot.Click_Item_Display(equipment_data)
	Equipment_Equiped_Stat(equipment_list_equiped)

func Equipment_Equiped_Stat(equiped_list: Dictionary):
	# Equipment All Part
	var hat_stat: Equipment_Data = equiped_list[hat_equipment]
	var armor_stat: Equipment_Data = equiped_list[armor_equipment]
	var boot_stat: Equipment_Data = equiped_list[boot_equipment]
	var weapon_stat: Equipment_Data = equiped_list[weapon_equipment]
	var ring_stat: Equipment_Data = equiped_list[ring_equipment]
	var necklace_stat: Equipment_Data = equiped_list[necklace_equipment]
	
	# Equipment Damge
	var hat_attack:= hat_stat.Attack if hat_stat != null else 0
	var armor_attack:= armor_stat.Attack if armor_stat != null else 0
	var boot_attack:= boot_stat.Attack if boot_stat != null else 0
	var weapon_attack:= weapon_stat.Attack if weapon_stat != null else 0
	var ring_attack:= ring_stat.Attack if ring_stat != null else 0
	var necklace_attack:= necklace_stat.Attack if necklace_stat != null else 0
	
	var equiped_attack := hat_attack + armor_attack + boot_attack + weapon_attack + ring_attack + necklace_attack
	var attack_label : Label = equipment_stat.get_child(0).get_child(0)
	if equiped_attack != 0:
		attack_label.visible = true
		attack_label.text = "Damage: %s" %equiped_attack
	else:
		attack_label.visible = false	
	
	# Equipment Health
	var hat_health:= hat_stat.Health if hat_stat != null else 0
	var armor_health:= armor_stat.Health if armor_stat != null else 0
	var boot_health:= boot_stat.Health if boot_stat != null else 0
	var weapon_health:= weapon_stat.Health if weapon_stat != null else 0
	var ring_health:= ring_stat.Health if ring_stat != null else 0
	var necklace_health:= necklace_stat.Health if necklace_stat != null else 0
	
	var equiped_health := hat_health + armor_health + boot_health + weapon_health + ring_health + necklace_health
	var health_label : Label = equipment_stat.get_child(0).get_child(1)
	if equiped_health != 0:
		health_label.visible = true
		health_label.text = "Health: %s" % equiped_health
	else:
		health_label.visible = false
	
	Equiped_Stat_Signal.emit(equiped_attack,equiped_health)
		
		
		
		
		
		
		
