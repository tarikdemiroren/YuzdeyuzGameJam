class_name DusmanPiyade extends Dusman
	
func _init(health : int = 3):
	super._init(health)
func take_damage(damage : int):
	super.take_damage(damage)
func is_alive():
	super.is_alive()
func place_on(pos : Vector2i):
	super.place_on(pos)
func return_to_hand():
	super.return_to_hand()
func find_neighbors(range : int = 1):
	super.find_neighbors(range)

var base_range : int = 1
var base_atk : int = 1
var initiative : int = 80
