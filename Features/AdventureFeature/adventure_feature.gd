extends Control

@onready var Map:= $Map

func _ready():
	Map.map_1.pressed_connect(Change_Map_Scene)
	
func Change_Map_Scene():
	pass
