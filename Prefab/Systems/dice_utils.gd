extends Node



# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	pass # Replace with function body.


func roll(side : int)->int:
	return randi() % side + 1;

