extends Control

@onready var container : GridContainer = $Container
@onready var information := $item_information

@onready var item1 : Item_Data = preload("res://Features/InventoryFeature/Items/Item/Data/item1.tres")
@onready var item2 : Item_Data = preload("res://Features/InventoryFeature/Items/Item/Data/item2.tres")
@onready var weapon1 : Item_Data = preload("res://Features/InventoryFeature/Items/Equipment/Data/weapon1.tres")
var inventory_container_list : Dictionary[int,Item_Data]


func _ready():
	
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
			print(inventory_item[inventory])
			item_instance.Item_Holder_Display(inventory_item[inventory])
		
		item_instance.Drag_Item.connect(Item_Change)
	
		
	print(inventory_container_list)
	
func Item_Change(from_holder, to_holder):
	inventory_container_list[from_holder.index] = from_holder.item
	inventory_container_list[to_holder.index] = to_holder.item
	Inventory_List_Display(inventory_container_list)
	pass

func _on_button_pressed():
	
	pass # Replace with function body.
