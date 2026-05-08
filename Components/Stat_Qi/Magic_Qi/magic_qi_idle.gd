extends Stat_Qi_Component
class_name Magic_Qi_Idle

var base_qi_idle: int

func Base_Qi_Idle(amount: int):
	base_qi_idle = amount
	_recalculate()


func _calculate_value():
	var book_qi_idle :int = cultivation_book.Magical_Qi_Idle if cultivation_book is Magical_Book else 0
	return base_qi_idle + book_qi_idle
