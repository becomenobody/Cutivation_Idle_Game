extends Player_State
class_name Run_State

func _enter():
	print("enter run state")
	player.velocity.y = 0
	player.animation_player.play("run_state")

func _physics_update(delta):
	var direction_x := Input.get_axis("ui_left","ui_right")
	player.velocity.x = player.Speed * direction_x
	player.move_and_slide() 
	
	if is_equal_approx(direction_x,0.0):
		State_Transition_Signal.emit(IDLE)

	
