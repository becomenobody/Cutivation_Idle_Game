extends Control

signal Book_Equiped_Signal(book_data: Resource)
@onready var panel : Panel = $Panel
@onready var container : ScrollContainer = $ScrollContainer

@onready var book_icon : TextureRect = $ScrollContainer/BoxContainer/Icon_Holder/Icon
@onready var book_experiment_bar : ProgressBar = $ScrollContainer/BoxContainer/Icon_Holder/Experiment_Bar
@onready var book_experiment : Label = $ScrollContainer/BoxContainer/Icon_Holder/Experiment_Bar/Experiment

@onready var book_name : Label = $ScrollContainer/BoxContainer/Information/Name
@onready var book_level : Label = $ScrollContainer/BoxContainer/Information/Level
@onready var book_type_cultivation : Label = $ScrollContainer/BoxContainer/Information/Type_Cultivation
@onready var book_type_element : Label = $ScrollContainer/BoxContainer/Information/Type_Element
@onready var book_type_tier : Label = $ScrollContainer/BoxContainer/Information/Type_Tier
@onready var book_qi_idle : Label = $ScrollContainer/BoxContainer/Information/Qi_Idle
@onready var book_qi_bonus : Label = $ScrollContainer/BoxContainer/Information/Qi_Bonus
@onready var book_equip : Button = $BookEquip


func Book_Information_Display_UI(book_data:Resource):
	panel.size = container.size
	book_icon.texture = book_data.Icon
	book_experiment.text = "%s/%s" %[book_data.Level_Experiment,book_data.Experiment_To_Level_Up[0]] 
	
	book_name.text = book_data.Name
	book_level.text = "Level: %s" %book_data.Level
	book_type_cultivation.text = "Cultivaiton: " + str(book_data.Type_Cultivation.keys()[book_data.Cultivation])
	book_type_element.text = "Element: " +str(book_data.Type_Element.keys()[book_data.Element])
	book_type_tier.text = "Tier: " +str(book_data.Type_Tier.keys()[book_data.Tier])
	book_qi_idle.text = "Magical QI Idle: %s" %book_data.Magical_Qi_Idle
	book_qi_bonus.text = "Magical QI Bonus: %s" %book_data.Magical_Qi_Bonus 

	
	# Button Equip
	if book_equip.is_connected("pressed",Book_Button_Equip):
		book_equip.disconnect("pressed",Book_Button_Equip)
	book_equip.pressed.connect(Book_Button_Equip.bind(book_data))

func Book_Button_Equip(book_data : Resource):
	Book_Equiped_Signal.emit(book_data)
	print("equip: %s"  %book_data)
