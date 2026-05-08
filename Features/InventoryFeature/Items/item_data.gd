extends Resource
class_name Item_Data

enum Item_Type{
	CONSUMABLE,
	MATERIAL,
	EQUIPMENT,
	UNIQUE
}



@export var Name: String
@export var Item : Item_Type
@export var Icon : Texture
@export var Usage : String
