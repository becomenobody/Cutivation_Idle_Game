extends Stat_Qi_Component
class_name Magic_Qi_Tick

var base_qi_tick: int

func Base_Qi_Tick_Increase(amount: int):
	base_qi_tick += amount
	_recalculate()
	
func _calculate_value():
	var book_qi_tick : int = cultivation_book.Magical_Qi_Tick if cultivation_book is Magical_Book else 0
	return base_qi_tick + book_qi_tick
