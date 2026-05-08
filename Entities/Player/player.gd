extends Node2D
class_name Player

signal Qi_Per_Tick_Signal(value)
signal Book_Signal(value)
signal Book_Equiped_Signal(value)


@onready var m_Function : My_Function = My_Function.new()
var player_attack : Attack_Component = Attack_Component.new()
var player_health : Health_Component = Health_Component.new()
var player_level : Level_Component = Level_Component.new()
var player_magic_qi_idle : Magic_Qi_Idle = Magic_Qi_Idle.new()
var player_magic_qi_experiment : Magic_Qi_Experiment = Magic_Qi_Experiment.new()
var player_magic_qi_tick : Magic_Qi_Tick = Magic_Qi_Tick.new()


# Data Can Saved/Loaded
var Player_Realm_Level : int = 0
var Player_Magic_Qi_Experiment : int # Player QI Experiment
var Player_Magic_Qi_Idle : int = 1 # Amount of Qi when cultivate per times
var Player_Magic_Qi_Tick : float = 100 # Time Second per tick
var Tick = 0 
var TimeLap = 0.0
var Player_Current_Health : int
var Player_Max_Health : int = 100
var Player_Attack : int = 10
var Player_Magical_Book_Equip_Slot : int = 0

var Book_Item_List : Array = [] # 
var Equip_Maigcal_Book_Item_List : Array  # Later

func _ready():
	#Player_Stat_Component.Value_Changed_Signal.connect()
	Player_Magic_Qi_Experiment = player_magic_qi_experiment.value
	Equip_Maigcal_Book_Item_List.resize(Player_Magical_Book_Equip_Slot)
	print(Equip_Maigcal_Book_Item_List.size())
	Book_Equiped_Signal.connect(Equiped_Book_Stat)
	
func _process(delta):
	Qi_Increase_Time(delta)

func Stat_Ready():
	pass
func Add_Book():
	var item = preload("res://Features/CultivationFeature/MagicCultivation/BookFeature/Data/Magical_Book/magic1.tres")
	var item2 = preload("res://Features/CultivationFeature/MagicCultivation/BookFeature/Data/Magical_Book/magic2.tres")
	if !Book_Item_List.has(item):
		m_Function.Add_Thing(Book_Item_List,item)
		m_Function.Add_Thing(Book_Item_List,item2)
		Book_Signal.emit(Book_Item_List)
	return

func Equiped_Book(book_data: Resource):
	m_Function.Equip_Item(Equip_Maigcal_Book_Item_List,book_data)
	Book_Equiped_Signal.emit(Equip_Maigcal_Book_Item_List)

func Equiped_Book_Stat(equip_book):
	for book in equip_book:
		player_magic_qi_idle.Cultivation_Book_Attach(book)
		player_magic_qi_tick.Cultivation_Book_Attach(book)
		pass
	

func Player_Stat_Loaded(): # Player Loaded 
	player_level.value = Player_Realm_Level
	player_magic_qi_experiment.value = Player_Magic_Qi_Experiment
	player_magic_qi_idle.Base_Qi_Idle(Player_Magic_Qi_Idle)
	player_magic_qi_tick.value = Player_Magic_Qi_Tick
	# Health Component
	player_health.value = Player_Max_Health
	# Attack  Component
	player_attack.value = Player_Attack



func Qi_Increase_Time(delta): # Increase time per (100 *delta = 1 seconds)
	TimeLap += delta # Time per Tick
	Tick += player_magic_qi_tick.value * delta
	#print(round(Player_Qi_Idle / TimeLap)) # How many Qi in 1 seceond
	if Tick >= 100:
		Tick = 0
		var Qi_Per_Tick = Player_Magic_Qi_Idle / TimeLap # Value of Qi Experiment per tick
		TimeLap = 0
		Qi_Per_Tick_Signal.emit(Qi_Per_Tick) 
		player_magic_qi_experiment.value += player_magic_qi_idle.value
		Player_Magic_Qi_Experiment = player_magic_qi_experiment.value #📄 Save Player_Qi_Experiment
		
		
 
func BreakThrough_Stat_Up(value):
	player_health.Base_Max_Health_Increase(value)
	player_attack.Base_Attack_Increase(10)
	Player_Max_Health = player_health.value #📄 Save Player_Max_Health
	Player_Attack = player_attack.value #📄 Save Player_Attack


func _on_test_pressed():
	Add_Book()
	pass # Replace with function body.
