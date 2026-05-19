extends Node2D


@onready var Main_Cultivation_Feature : Cultivation_Feature = Cultivation_Feature.new()
@onready var player = %Player
@onready var ui = %UI
@onready var saver_loader : Saver_Loader = $System/SaverLoader

@onready var player_new_game : Player_Res 

func _ready():
	# Saver Loader
	ui.save.pressed.connect(save_button)
	ui.load.pressed.connect(load_button)
	
	Signal_Connection()
	Start_New_Game()
	
	Cultivation_Feature_Player()
	
	#Ui Meditation Layout 
	ui.cultivation_maigc.Realm_Display(Main_Cultivation_Feature.Level_Realm_Feature.Realm[player.Player_Realm_Level]) # Check first Display Realm level UI
	ui.cultivation_maigc.Meditation_Layout_Display(Main_Cultivation_Feature.Meditation_Feature.Dict_Meditation_Data)
	
	pass

func testing_menu_game(player_res : Player_Res):
	player_new_game = player_res
	print("Start game : %s,%s" %[player_new_game.health,player_new_game.attack])

# Start New Game button
func Start_New_Game():
	player.player_attack.Base_Attack(player_new_game.attack) 
	player.player_health.Base_Max_Health(player_new_game.health)
	player.player_level.value = player_new_game.level
	player.player_magic_qi_idle.value = player_new_game.magic_qi_idle
	player.player_magic_qi_tick.value = player_new_game.magic_qi_tick
	player.player_magic_qi_experiment.value = 0
	
func save_button():
	saver_loader.save_game()

func load_button():
	saver_loader.load_game()
	player.Player_Stat_Loaded()

# Loaded when start game with Saved/Loaded(nrn)
func Realm_Level_Loaded(level : int):
	ui.qi_max_value = Main_Cultivation_Feature.Level_Realm_Feature.Level_Up_Realm[level + 1]
	ui.cultivation_maigc.qi_max_experiment =  Main_Cultivation_Feature.Level_Realm_Feature.Level_Up_Realm[level + 1]
	ui.Menu_Realm_Display(Main_Cultivation_Feature.Level_Realm_Feature.Realm[level])
	ui.cultivation_maigc.Realm_Display(Main_Cultivation_Feature.Level_Realm_Feature.Realm[level])
	

# UI Function
func Signal_Connection():
	# Player Signal to UI
	player.player_magic_qi_experiment.Value_Changed.connect(ui.cultivation_maigc.Player_Qi_Experiment_Display)
	player.player_health.Value_Changed.connect(ui.Menu_Health_Display)
	player.player_attack.Value_Changed.connect(ui.Menu_Attack_Display)
	player.Qi_Per_Tick_Signal.connect(ui.cultivation_maigc.Player_Qi_Per_Tick) # Qi_Per_Tick signal (player)
	player.player_magic_qi_experiment.Value_Changed.connect(ui.Menu_Qi_Experiment_Display)
	player.player_level.Value_Changed.connect(Realm_Level_Loaded)
	player.player_magic_qi_idle.Value_Changed.connect(ui.cultivation_maigc.Player_Qi_Idle_Display)
	player.Book_Signal.connect(ui.cultivation_maigc.Book_Container_UI)
	player.player_magic_qi_tick.Value_Changed.connect(ui.cultivation_maigc.Player_Qi_Tick_Display)
	player.player_magic_qi_experiment.Value_Changed.connect(ui.cultivation_maigc.Progress_Bar_Qi_Experiment_Value)
	
	#ui connect
	ui.cultivation_maigc.break_through_btn.pressed.connect(Cultivation_Feature_Button_UI) # Button connect to breakthrough feature
	ui.cultivation_maigc.Meditation_Level_Up_Stat.connect(Meditation_Level_Up)
	ui.cultivation_maigc.Equiped_Book_Signal.connect(player.Equiped_Book)
	ui.inventory_feature.equipment.Equiped_Stat_Signal.connect(Inventory_Feature_Player)

#region Cultivation Features
# Cultivation Features Function
func Cultivation_Feature_Player():
	#Main Cultivation Signal to Player
	Main_Cultivation_Feature.Breakthrough_Signal.connect(Breakthrough_Magical_Update)# Breakthrough (cultvvaton feature)
	Main_Cultivation_Feature.Breakthrough_Stat_Up.connect(player.BreakThrough_Stat_Up)

func Cultivation_Feature_Button_UI():
	Main_Cultivation_Feature.Cultivation_Breakthrough(player.Player_Realm_Level,player.Player_Magic_Qi_Experiment) # Cultivation Breakthrough feature
	ui.cultivation_maigc.Realm_Display(Main_Cultivation_Feature.Level_Realm_Feature.Realm[player.Player_Realm_Level]) # Display Realm level UI
	ui.Menu_Realm_Display(Main_Cultivation_Feature.Level_Realm_Feature.Realm[player.Player_Realm_Level])
	
	#Notification
	ui.Create_Notification("Level Up", 1)

func Breakthrough_Magical_Update(realm, qi): #Update Player when breakthrough or ste
	player.Player_Realm_Level = realm #📄 Save Player_Realm_Level
	ui.Max_Qi_Experiment(Main_Cultivation_Feature.Level_Realm_Feature.Level_Up_Realm[realm + 1])
	ui.cultivation_maigc.qi_max_experiment =  Main_Cultivation_Feature.Level_Realm_Feature.Level_Up_Realm[realm + 1]
	player.player_magic_qi_experiment.value -= qi
#endregion

func Meditation_Level_Up(value: int):
	player.player_magic_qi_tick.Base_Qi_Tick_Increase(value)

func Inventory_Feature_Player(attack: int, health: int):
	player.player_attack.Equipment_Equiped_Attack(attack)
	player.player_health.Equipment_Equiped_Health(health)
	
