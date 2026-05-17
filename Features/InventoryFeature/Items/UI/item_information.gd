extends Control

# Item Type : [Consumable, Material,Weapon,Unique]

@onready var icon : TextureRect = $ScrollContainer/BoxContainer/Icon_Holder/Icon
@onready var i_name : Label = %Name
@onready var type : Label = %Type
@onready var usage : Label = %Usage
@onready var item_btn : Button = $item_btn


func Information_Display(item_data : Item_Data):
	if item_data == null:
		return
	icon.texture = item_data.Icon
	i_name.text = item_data.Name
	usage.text = item_data.Usage
	
	Item_Button_Text_Diplay(item_data)

func Item_Button_Text_Diplay(item_data :Item_Data):
	if item_data.Item == 0: # Consumable
		item_btn.visible = true
		item_btn.text = "Use"
	elif item_data.Item == 1: # Material
		item_btn.visible = false
		item_btn.text = item_data.Item_Type.keys()[item_data.Item]
	elif item_data.Item == 2: # Weapon
		item_btn.visible = true
		item_btn.text = "Equip"
		
