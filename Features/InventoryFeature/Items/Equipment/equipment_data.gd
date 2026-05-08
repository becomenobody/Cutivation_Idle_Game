extends Item_Data
class_name Equipment_Data 
	
enum Equipment_Type{
	HAT,
	ARMOR,
	BOOT,
	WEAPON,
	RING,
	NECKLACE
}

@export var Equipment : Equipment_Type
@export var Type : Item_Type = Item_Type.EQUIPMENT
