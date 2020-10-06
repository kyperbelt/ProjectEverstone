extends Node2D

export(float) var _speed = 1 #seconds per tile
var elapsed : float = 0

#integer values perteining to a tile position
# position / tile size
var x : int
var y : int

var startX : int
var startY : int

var moving : bool = false


func _init():
	pass

func _ready():
	#get x and y tile position from placed positon in scene
	set_tile_from_pos(position.x,position.y)
	var _e = move_to(x,y,true)
	startX = x
	startY = y
	pass


func _process(delta):
	proccess_tile_move(delta)

func proccess_tile_move(delta : float):
	if !moving : 
		return 
	
	elapsed += delta
	if elapsed >= _speed:
		elapsed = 0
		set_pos_from_tile(x,y)
		print("position x:%s y:%s"%[x,y])                   
		moving = false
		return
		
	var targetPos : Vector2 = Vector2(x * Constants.TILE_WIDTH, y * Constants.TILE_HEIGHT)
	var t = elapsed / _speed

	var lastPos : Vector2 = Vector2(startX * Constants.TILE_WIDTH,startY * Constants.TILE_HEIGHT)

	position.x = lastPos.x + ((targetPos.x - lastPos.x) * t)
	position.y = lastPos.y + ((targetPos.y - lastPos.y) * t)

		
	pass

func is_moving()->bool:
	return moving

#move to the locattion
#return true if move is possible
#		false if it is not
func move_to(tx:int,ty:int,instant : bool = false)->bool:
	if moving:
		return false;

	startX = x
	startY = y
	x = tx
	y = ty
	if !instant:
		moving = true;
	else:
		moving = false
		set_pos_from_tile(tx,ty)
	return true

#setters - getters
func set_speed(speed):
	_speed = speed if speed > 0 else 0

func get_speed()->float:
	return _speed

#set tile pos from world position
func set_tile_from_pos(px:float,py:float):
	x = (px / Constants.TILE_WIDTH) as int
	y = (py / Constants.TILE_HEIGHT) as int

#set world position from tile
func set_pos_from_tile(tx:int , ty:int):
	position.x = tx*Constants.TILE_WIDTH
	position.y = ty*Constants.TILE_HEIGHT

