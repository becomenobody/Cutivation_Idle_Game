extends Player_State
class_name Idle_State


func _enter():
	print("enter idle state")
	player.velocity.y = 0
	player.velocity.x = 0
	player.animation_player.play("idle_state")

	
func _physics_update(delta):
	if Input.is_action_pressed("ui_left") or Input.is_action_pressed("ui_right"):
		State_Transition_Signal.emit(RUNNING)
	elif !player._is_on_floor:
		State_Transition_Signal.emit(FALLING)
