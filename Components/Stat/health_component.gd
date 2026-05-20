extends Stat_Component
class_name Health_Component

var base_current_health : int
var base_max_health : int

var equiped_health: int

func Base_Max_Health(amount: int):
	base_max_health += amount
	_recalculate()

func Equipment_Equiped_Health(amount: int):
	equiped_health = amount
	_recalculate()

func _calculate_value():
	print("Calculate: %s" %base_max_health)
	return base_max_health + equiped_health
