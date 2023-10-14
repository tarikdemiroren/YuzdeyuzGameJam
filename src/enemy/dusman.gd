extends Node

class_name Dusman

var cur_health : int
var max_health : int
var grid_position : Vector2i
var isPlaced : bool

func _init(health : int):
	cur_health = health
	max_health = health
	isPlaced = false

func take_damage(damage : int):
	cur_health -= damage

func is_alive():
	return cur_health > 0
	
func place_on(pos : Vector2i):
	grid_position = pos
	isPlaced = true

func return_to_hand():
	isPlaced = false

func find_neighbors(range : int = 1):
	var neighs = []
	for x in range(-1*range,range+1):
		for y in range(-1*range,range+1):
			neighs.append((Vector2i)(x,y))
	return neighs

