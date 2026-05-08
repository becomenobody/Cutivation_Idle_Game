extends Node
class_name Cultivation_Feature

signal Breakthrough_Signal(realm, qi)
signal Breakthrough_Stat_Up(health)

# Data
var Level_Realm_Feature : Level_Realm_Data = Level_Realm_Data.new()
var Meditation_Feature : Meditation_Data = Meditation_Data.new()

func Cultivation_Breakthrough(player_level: int,player_qi : int,) :
	if player_qi >= Level_Realm_Feature.Level_Up_Realm[player_level + 1]:
		player_level += 1
		Breakthrough_Signal.emit(player_level, Level_Realm_Feature.Level_Up_Realm[player_level]) 
		Breakthrough_Stat_Up.emit(100)
	else: print("not enough QI")

	
