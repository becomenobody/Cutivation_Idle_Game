extends Node
class_name Saver_Loader

@onready var player = %Player

func save_game():
	var saved_game : Saved_Game = Saved_Game.new()
	
	saved_game.player_health = player.Player_Max_Health
	saved_game.player_attack = player.Player_Attack
	saved_game.player_magic_qi_experiment = player.Player_Magic_Qi_Experiment
	saved_game.player_magic_qi_idle = player.Player_Magic_Qi_Idle
	saved_game.player_realm_level = player.Player_Realm_Level

	var  saved_data : Array[Saved_Data] = []
	get_tree().call_group("game_events","_on_save_game", saved_data)
	
	saved_game.saved_data = saved_data
	ResourceSaver.save(saved_game,"user://save_game.tres")
	print("Saved Successfully")
	
func load_game():
	var saved_game : Saved_Game = load("user://save_game.tres") as Saved_Game
	
	if !saved_game:
		return
	
	# Loaded Basic Player
	player.Player_Max_Health = saved_game.player_health
	player.Player_Attack = saved_game.player_attack
	player.Player_Magic_Qi_Experiment = saved_game.player_magic_qi_experiment
	player.Player_Magic_Qi_Idle = saved_game.player_magic_qi_idle
	player.Player_Realm_Level = saved_game.player_realm_level
	
	# Loaded Advance Scene (Weapon,Enemy,Cultivation Book..)
	for item in saved_game.saved_data:
		var scene := load(item.scene_path) as PackedScene
		var restore_scene := scene.instantiate()
		get_tree().current_scene.add_child(restore_scene)
		
		if restore_scene.has_method("_on_load_game"):
			restore_scene._on_load_game(item)
	print("Loaded Successfully")
