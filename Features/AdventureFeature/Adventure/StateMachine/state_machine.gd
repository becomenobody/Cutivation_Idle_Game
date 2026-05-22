extends Node
class_name StateMachine

@export var initial_state: State

var current_state: State
var states : Dictionary = {}

func _ready():
	for child in self.get_children():
		if child is State:
			states[child.name.to_lower()] = child
			child.State_Transition_Signal.connect(change_state_animation)
			
	await owner.ready
	if initial_state:
		initial_state._enter()
		current_state = initial_state
	pass

func _process(delta):
	if current_state:
		current_state._update(delta)
		
func _physics_process(delta):
	if current_state:
		current_state._physics_update(delta)

func change_state_animation(new_state_name : String):
	var new_state = states.get(new_state_name.to_lower())
	if !new_state and new_state == current_state:
		return
	
	current_state._exit()
	print("new state: %s" %new_state)
	new_state._enter()
	current_state = new_state
