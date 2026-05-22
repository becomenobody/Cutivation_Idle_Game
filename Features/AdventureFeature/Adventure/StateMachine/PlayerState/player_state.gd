extends State
class_name Player_State

const IDLE = "idle_state"
const RUNNING = "run_state"
const JUMPING = "jump_state"
const FALLING = "fall_state"

var player: Player_Adventure
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready() -> void:
	pass
	await owner.ready
	player = owner as Player
	assert(player != null, "The PlayerState state type must be used only in the player scene. It needs the owner to be a Player node.")
