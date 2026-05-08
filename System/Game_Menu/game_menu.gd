extends Node2D

@onready var player_res : Player_Res = preload("res://Entities/Player/New_Player/player1.tres")
@onready var main_game := preload("res://main.tscn").instantiate()

@onready var new_game : Button = $NewGame
@onready var load_game : Button = $LoadGame
@onready var exit : Button = $Exit

func _ready():
	
	new_game.pressed.connect(Create_New_Game.bind(player_res))
	
func Create_New_Game(player_res : Player_Res):
	main_game.testing_menu_game(player_res)
	get_tree().root.add_child(main_game)
	self.queue_free()
