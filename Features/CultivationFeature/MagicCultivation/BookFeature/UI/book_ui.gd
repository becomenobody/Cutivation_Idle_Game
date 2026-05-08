extends Control

signal Get_Book_Data(book_data: Resource)

@onready var book_container : GridContainer = $BookContainer

func _ready():
	pass
	
func Book_Container(book_data : Array):
	for book_count in book_data.size():
		var book_layout = preload("res://Features/CultivationFeature/MagicCultivation/BookFeature/UI/book_layout.tscn").instantiate()
		book_container.add_child(book_layout)
		var book_button = book_container.get_child(book_count)
		book_button.get_child(0).texture = book_data[book_count].Icon
		book_button.pressed.connect(Get_Data.bind(book_data[book_count]))

func Get_Data(book_data: Resource):
	Get_Book_Data.emit(book_data)
