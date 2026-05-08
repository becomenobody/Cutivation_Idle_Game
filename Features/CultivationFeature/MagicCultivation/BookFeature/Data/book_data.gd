extends Item_Data
class_name Book_Data

enum Type_Cultivation {
	MAGICAL,
	PHYSICAL,
	MIND
}
enum Type_Element {
	NONE,
	FIRE,
	EARTH,
	METAL,
	WATER,
	WOOD,
	ELECTRIC,
	WIND,
	ICE,
}
enum Type_Tier {
	COMMON,
	UNCOMMON,
	RARE,
	EPIC,
}
enum Type_Level{
	
}

@export var Experiment_To_Level_Up: Array[int] =[200,1000,10000]
@export var Level : int
@export var Level_Experiment: int 
@export var Layout : Texture
@export var Cultivation : Type_Cultivation
@export var Element : Type_Element
@export var Tier : Type_Tier
@export var Description : String
