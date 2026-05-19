extends Node
class_name Stat_Component

signal Value_Changed(value)

var cultivation_book : Book_Data
var value : int :
	set(new_value):
		value = new_value
		Value_Changed.emit(value)
		

func Cultivation_Book_Attach(book_data: Book_Data):
	cultivation_book = book_data
	_recalculate()


func _calculate_value()->int:
	return 0
	
func _recalculate():
	value = _calculate_value()
	Value_Changed.emit(value)
