extends Node


var menu_change : Menu_Change = Menu_Change.new()
var m_function_ui : My_Function_UI = My_Function_UI.new()
#Saver Loader
@onready var save := $Save
@onready var load := $Load

@onready var cultivation_feature: Control = $Cultivation_Feature
@onready var cultivation_maigc: Control = $Cultivation_Feature/Cultivation_Magic
@onready var adventure_feature = $Adventure_Feature
@onready var inventory_feature = $Inventory_Feature

func _ready():
	Clear_Notification()
	Menu_Feature_Change()

func _process(delta):
	pass
	


# Main Menu Container
@onready var avatar = $Menu_Container/Stat/Avatar
@onready var health = $Menu_Container/Stat/Health
@onready var attack = $Menu_Container/Stat/Attack
@onready var experiment = $Menu_Container/Stat/Experiment
@onready var realm = $Menu_Container/Stat/Realm
@onready var cultivation_btn = $Menu_Container/Menu_Bar/Cultivation
@onready var adventure_btn = $Menu_Container/Menu_Bar/Adventure
@onready var inventory_btn = $Menu_Container/Menu_Bar/Inventory

var menu_bar_button_list : Array[Button]
var menu_bar_feature_list : Array[Control]

var qi_max_value : int = 0

func Menu_Feature_Change():
	menu_bar_feature_list = [cultivation_feature,adventure_feature,inventory_feature]
	menu_bar_button_list = [cultivation_btn,adventure_btn,inventory_btn]
	menu_change.Button_Menu_Change(menu_bar_button_list,menu_bar_feature_list)

func Max_Qi_Experiment(value : int) :
	qi_max_value = value

func Menu_Health_Display(value : int): # Player Health Display
	health.text = "Health : " + str(value) 

func Menu_Attack_Display(value: int):
	attack.text = "Attack: " + str(value)

func Menu_Qi_Experiment_Display(value: int):
	experiment.text = "QI: " + str(value) + "/" + str(qi_max_value)

func Menu_Realm_Display(value: String):
	realm.text = value

#Adventure Feature

#region Notification
# Notification 
@onready var notification = $Notification
@onready var clear : Button = $Notification/Clear

func Clear_Notification():
	clear.pressed.connect(Clear)

func Clear():
	for child in notification.get_child_count():
		if notification.get_child(child) is Label:
			notification.get_child(child).queue_free()

func Create_Notification(text : String, value):
	var label : Label = Label.new()
	notification.add_child(label)
	label.text = text + " + " + str(value)  
#endregion
