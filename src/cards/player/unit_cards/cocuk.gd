extends Birlik

class_name Cocuk

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "Sıradaki birlik alımında daha nadir kartların gelme olasılığını artırır."
	max_health = 2
	needforfood = 1
	rarity = Rarity.RARE
	
