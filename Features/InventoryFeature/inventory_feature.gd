extends Control

@onready var container : GridContainer = $Container
@onready var information := $item_information
@onready var equipment := %Equipment

@onready var item1 : Item_Data = preload("res://Features/InventoryFeature/Items/Item/Data/item1.tres")
@onready var item2 : Item_Data = preload("res://Features/InventoryFeature/Items/Item/Data/item2.tres")
@onready var weapon1 : Item_Data = preload("res://Features/InventoryFeature/Items/Equipment/Data/weapon1.tres")
var inventory_container_list : Dictionary[int,Item_Data]


func _ready():
	for equip_slot in equipment.equipment_connection.size():
		equipment.equipment_connection[equip_slot].Drag_Item.connect(Item_Change)
	
	for i in range(40):
		inventory_container_list[i] = null
	
	inventory_container_list[0] = item1
	inventory_container_list[1] = item2
	
	Inventory_List_Display(inventory_container_list)
	pass
	
func Inventory_List_Display(inventory_item):
	for inventory_node in container.get_children():
		inventory_node.queue_free()
	
	for inventory in range(inventory_item.size()):
		var item_instance : Control = preload("res://Features/InventoryFeature/Items/UI/item_holder.tscn").instantiate()
		container.add_child(item_instance)
		item_instance.index = inventory
		
		# Check if inventory got item
		if inventory_item[inventory] != null:
			#print(inventory_item[inventory])
			item_instance.Item_Holder_Display(inventory_item[inventory])
		
		item_instance.Drag_Item.connect(Item_Change)
	
	
func Item_Change(from_holder, to_holder):
	# Check item from inventory or equipment
	print("Working")
	# Inventory -> Inventory
	if from_holder.Slot_Type.INVENTORY == from_holder.slot_type and to_holder.Slot_Type.INVENTORY == to_holder.slot_type:
		print("inventory -> inventory")
		var tmp : Item_Data
		tmp = inventory_container_list[from_holder.index]
		inventory_container_list[from_holder.index] = inventory_container_list[to_holder.index]
		inventory_container_list[to_holder.index] = tmp 
		Inventory_List_Display(inventory_container_list)
		
	# Inventory -> Equipment
	if from_holder.Slot_Type.INVENTORY == from_holder.slot_type and from_holder.item is Equipment_Data \
	 and to_holder.Slot_Type.EQUIPMENT == to_holder.slot_type:  #Check if it Equipment Data
		print("inventory -> equipment")
		var tmp : Equipment_Data
		tmp = inventory_container_list[from_holder.index]
		if tmp.Equipment_Type.keys()[tmp.Equipment].to_lower() == to_holder.name.to_lower(): # Check what is that equipment
			inventory_container_list[from_holder.index] = equipment.equipment_list_equiped[to_holder]
			equipment.equipment_list_equiped[to_holder] = tmp
			Inventory_List_Display(inventory_container_list)
			equipment.Equipment_Equiped_Display(to_holder,equipment.equipment_list_equiped[to_holder])



func _on_button_pressed():
	var index = 3
	inventory_container_list[index] = weapon1
	Inventory_List_Display(inventory_container_list)
	pass # Replace with function body.
