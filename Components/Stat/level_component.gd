extends Stat_Component
class_name Level_Component


var Level : int 

func Level_Changed(amount: int):
	Level += amount
	_recalculate()
	
func _calculate_value():
	return Level
