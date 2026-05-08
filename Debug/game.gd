extends Node2D

@onready var button : Button = $Button
@onready var container : VBoxContainer = $Container

var attack = 10

func _ready():
	button.pressed.connect(button_press.bind(attack))
	
func button_press(text: String,value):
	var label : Label = Label.new()
	container.add_child(label)
	label.text = text +": "+ str(value)
	
	
