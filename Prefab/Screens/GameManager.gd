extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	print("in game mode")
	pass # Replace with function body.


var elapsed : float = 0

func _process(delta):
	var size = 6
	elapsed += delta

	if elapsed > .5:
		elapsed = 0
		print("Rolled %s sided dice : Result = %s " % [size,DiceUtils.roll(6)])
	pass

