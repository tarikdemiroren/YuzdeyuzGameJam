extends Node

class_name Dusman

var cur_health
var max_health
var position : Vector2i

func _init(health : int):
	cur_health = health
	max_health = health

func take_damage(damage : int):
	cur_health -= damage

func is_alive():
	return cur_health > 0
	
func place_on(pos : Vector2i):
	position = pos
	
func find_neighbors(range : int = 1):
	var neighs = []
	for x in range(-1*range,range+1):
		for y in range(-1*range,range+1):
			neighs.append((Vector2i)(x,y))
	return neighs

