extends Stat_Component
class_name Attack_Component

var base_attack : int
var equiped_attack : int

func Base_Attack(amount : int):
	base_attack += amount
	_recalculate()
	
func Equipment_Equiped_Attack(amount: int):
	equiped_attack = amount
	_recalculate()
	
func _calculate_value() -> int:
	return base_attack + equiped_attack
	
