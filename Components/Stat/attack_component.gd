extends Stat_Component
class_name Attack_Component

var base_attack : int

func Base_Attack_Increase(amount : int):
	base_attack += amount
	_recalculate()
	
func _calculate_value() -> int:
	return base_attack
	
