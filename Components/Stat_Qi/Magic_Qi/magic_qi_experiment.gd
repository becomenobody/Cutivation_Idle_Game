extends Stat_Qi_Component
class_name Magic_Qi_Experiment

var base_qi_experiment: int

func Base_Qi_Experiment_Increase(amount: int):
	base_qi_experiment += amount
	_recalculate()
	
func _calculate_value():
	return base_qi_experiment
