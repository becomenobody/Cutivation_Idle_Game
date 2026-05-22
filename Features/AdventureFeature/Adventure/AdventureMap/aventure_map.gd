extends Node2D

@onready var btn := $CanvasLayer/Button

func _ready():
	self.visible = true
	btn.visible = true

# Back to map
func _on_button_pressed():
	self.queue_free()
	pass # Replace with function body.
