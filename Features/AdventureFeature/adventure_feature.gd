extends Control

@onready var map := $Map
@onready var back_map:= $BackMap
var fight_scene := preload("res://Features/AdventureFeature/Fight/fight.tscn").instantiate()

func _ready():
	for adventure_stage in map.get_children():
		adventure_stage.pressed.connect(Change_Fight_Scene)
	back_map.pressed.connect(Return_Map)
	
	
func Change_Fight_Scene():
	self.add_child(fight_scene)
	map.visible = false
	back_map.visible = true
	var player_data = get_parent().get_parent().player
	fight_scene.Player_Holder_Display(player_data)
	
func Return_Map():
	map.visible = true
	self.remove_child(fight_scene)
	back_map.visible = false
	
