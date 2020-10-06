extends "res://Prefab/Systems/TileMap/tile_entity.gd"

onready var sprite = $Sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	sprite.scale.x =  16/sprite.texture.get_size().x
	sprite.scale.y =  16/sprite.texture.get_size().y
	pass # Replace with function body.

func _process(delta):
	handle_input(delta)
	pass

func handle_input(_delta:float):
	if Input.is_action_pressed(Constants.MOVE_UP):
		var _d = move_to(x,y-1)
	if Input.is_action_pressed(Constants.MOVE_RIGHT):
		var _d = move_to(x+1,y)
	if Input.is_action_pressed(Constants.MOVE_DOWN):
		var _d = move_to(x,y+1)
	if Input.is_action_pressed(Constants.MOVE_LEFT):
		var _d = move_to(x-1,y)

		
