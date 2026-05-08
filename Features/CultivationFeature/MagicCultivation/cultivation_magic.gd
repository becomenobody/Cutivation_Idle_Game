extends Control

signal Meditation_Level_Up_Stat(qi_tick: int)
signal Equiped_Book_Signal(book_data: Resource)


var menu_change : Menu_Change = Menu_Change.new()

@onready var qi: Label = $Realm/Qi
@onready var progress_bar: ProgressBar = $Realm/ProgressBar
@onready var break_through_btn: Button = $Realm/BreakThroughBtn
@onready var realm_display: Label = $Realm/RealmDisplay
@onready var qi_per_tick: Label = $Realm/Qi_Per_Tick
@onready var qi_idle: Label = $Realm/Qi_Idle
@onready var qi_tick: Label = $Realm/Qi_Tick

@onready var book_feature: Control = $Book
@onready var book_ui: Control = $Book/BookUI
@onready var meditation_btn: Button = $Menu/MeditationBtn
@onready var book_btn: Button = $Menu/BookBtn
@onready var book_information: Control = $Book/Book_Information
@onready var book_equiped: HBoxContainer = $Realm/Book_Equiped
@onready var meditation : BoxContainer = $Meditation

var cultivation_button_list : Array[Button]
var cultivation_menu_list : Array[Control]
var book_data_list : Array
var qi_max_experiment : int

func _ready():
	
	Cultivation_Feature_Menu_Change()
	Book_Signal_Connection()
	
	for i in range(2):
		var meditation_layout = preload("res://Features/CultivationFeature/MagicCultivation/MeditationFeature/UI/meditation_layout.tscn").instantiate()
		meditation.add_child(meditation_layout)
		meditation_layout.Meditation_Level_Up.connect(Meditation_Level_Cost)
func _process(delta):
	for child_node in meditation.get_children():
		child_node.Meditation_Progress(delta)

func Cultivation_Feature_Menu_Change():
	cultivation_button_list =  [meditation_btn, book_btn]
	cultivation_menu_list = [meditation, book_feature]
	menu_change.Button_Menu_Change(cultivation_button_list,cultivation_menu_list)
	pass
func Player_Qi_Experiment_Display(value: int): # Display of Qi Experiment
	qi.text ="QI: " + str(value) 

func Progress_Bar_Qi_Experiment_Value(qi_experiment): 
	progress_bar.value = qi_experiment
	progress_bar.max_value = qi_max_experiment

func Realm_Display(value): # Realm display 
	realm_display.text = str(value)

func Player_Qi_Per_Tick(value): # Qi Experiment per tick
	qi_per_tick.text = str("%0.2f" % value) + "/s"

func Player_Qi_Idle_Display(value):
	qi_idle.text = "QI Idle: %s" %value

func Player_Qi_Tick_Display(value):
	qi_tick.text = "Qi Tick: %s" %value



# Meditation Feature

func Meditation_Layout_Display(meditation_data : Dictionary):
	for child in meditation.get_child_count():
		var meditation_child = meditation_data[child]
		meditation.get_child(child).Meditation_Layout( # Layout Data of meditation
		meditation_child.Name, # Name of meditation 
		meditation_child.Level, # Level of meditation
		meditation_child.Description, # Description of meditation
		meditation_child.Idle, # Time idle
		) 

func Meditation_Level_Cost(Name : Node,level: int) :
	for child_node in meditation.get_children():
		if child_node == Name and  child_node == meditation.get_child(0):
			var cost_value : int = level * 100
			child_node.progress_bar.max_value = cost_value
			Meditation_Traquility_Level_Up()
			print(child_node.name+ ": " + str(cost_value))
		elif child_node == Name and child_node == meditation.get_child(1):
			var cost_value : int = level * 200
			child_node.progress_bar.max_value = cost_value
			print(child_node.name+ ": " + str(cost_value))

func Meditation_Traquility_Level_Up():
	var qi_tick : int = 100
	Meditation_Level_Up_Stat.emit(qi_tick)

# Cutivation Feature



#Book Feature
func Book_Signal_Connection():
	book_ui.Get_Book_Data.connect(Book_Get_Information)
	book_information.Book_Equiped_Signal.connect(Book_Equiped)

func Book_Container_UI(book_data_list : Array): #Like Inventory contains book
	book_ui.Book_Container(book_data_list)
	self.book_data_list = book_data_list

func Book_Get_Information(book_data: Resource): # Click in inventory get information
	book_information.Book_Information_Display_UI(book_data)
	pass

func Book_Equiped(book_data: Resource):
	var equiped_book = book_equiped.get_child(0)
	equiped_book.get_child(0).texture = book_data.Icon
	if equiped_book.has_connections("pressed"):
		equiped_book.disconnect("pressed",Book_Get_Information)
	equiped_book.pressed.connect(Book_Get_Information.bind(book_data))
	Equiped_Book_Signal.emit(book_data)
#endregion
