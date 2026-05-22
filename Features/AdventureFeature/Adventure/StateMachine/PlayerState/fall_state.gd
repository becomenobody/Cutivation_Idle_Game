extends Player_State
class_name Fall_State


func _enter():
	print("enter fall state")
	player.animation_player.play("fall_state")
	
	
func _physics_update(delta):
	player.velocity.y += gravity * delta
	player.move_and_slide()
	
	if player._is_on_floor:
		State_Transition_Signal.emit(IDLE)
