extends Stat_Component
class_name Health_Component

var base_current_health : int
var base_max_health : int


func Base_Max_Health_Increase(amount: int):
	base_max_health += amount
	_recalculate()

func _calculate_value():
	return base_max_health
