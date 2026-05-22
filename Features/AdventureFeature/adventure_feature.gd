extends Control

@onready var map:= $Map
@onready var adventure_map_1 = preload("res://Features/AdventureFeature/Adventure/AdventureMap/aventure_map_1.tscn")


func _ready():
	map.map_1.pressed.connect(Change_Map_Scene)
	
func Change_Map_Scene():
	var adventure_map_1_instance:= adventure_map_1.instantiate()
	owner.add_child(adventure_map_1_instance)
	self.visible = false
	pass
