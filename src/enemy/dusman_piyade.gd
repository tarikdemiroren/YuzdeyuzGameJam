class_name DusmanPiyade extends Dusman
	
func _init(health : int = 2):
	super._init(health)
func take_damage(damage : int):
	super.take_damage(damage)
func is_alive():
	super.is_alive()
func place_on(pos : Vector2i):
	super.place_on(pos)
func find_neighbors(range : int = 1):
	super.find_neighbors(range)

var range : int = 1
var atk : int = 1
