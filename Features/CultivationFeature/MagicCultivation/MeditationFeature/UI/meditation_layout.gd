extends Control

signal Meditation_Level_Up(Name: Node,Level : int)

@onready var meditation_name : Label = $Meditation_Name
@onready var meditation_level : Label = $Level
@onready var progress_bar : ProgressBar = $ProgressBar
@onready var meditation_btn : Button = $Meditation_Btn
@onready var meditation_description : Label = $Description

var idle_value : int
var idle_active : bool = true
var level : int = 0

func _ready():
	meditation_btn.toggled.connect(Meditation_Toggled)
	

func _process(delta):
	pass

func Meditation_Layout(name : String, level : int, description: String, idle: int):
	self.name = name
	meditation_name.text = name
	meditation_level.text = "Lv: " + str(level)
	meditation_description.text = description
	meditation_btn.pressed.connect(Meditation_Idle_Value.bind(idle))
	
func Meditation_Progress(delta):
	progress_bar.value += idle_value * delta
	if progress_bar.value >= progress_bar.max_value:
		progress_bar.value = 0
		level += 1
		meditation_level.text = "Lv: " + str(level)
		Meditation_Level_Up.emit(progress_bar.get_parent(),level)


func Meditation_Idle_Value(value: int) -> int:
	if idle_active:
		idle_value = value
		return idle_value
	else:
		idle_value = 0
		return idle_value

# Toogle on/off meditation
func Meditation_Toggled(toggled_on:bool):
	if toggled_on:
		idle_active = true
	else:
		idle_active = false
		
