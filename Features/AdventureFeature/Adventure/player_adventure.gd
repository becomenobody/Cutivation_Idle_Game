extends Player
class_name Player_Adventure

var Speed := 300

var _is_on_floor: bool = false
@onready var animation_player := $AnimatedSprite2D
@onready var ground_ray_cast: RayCast2D = $GroundRayCast

func _ready():
	
	pass

func _process(delta):
	Ground_Dectection()
		
func Ground_Dectection():
	if ground_ray_cast.is_colliding():
		_is_on_floor = true
	else:
		_is_on_floor = false

# Back to map
func _on_button_pressed():
	get_tree().change_scene_to_file("res://Features/AdventureFeature/adventure_feature.tscn")
	pass # Replace with function body.
