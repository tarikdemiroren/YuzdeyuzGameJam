extends Birlik

class_name Ciftci


# Called when the node enters the scene tree for the first time.
func _init():
	info = "Her tur 3 gıda üretir, tahıl karesinde ise fazladan 2 gıda daha üretir."
	max_health = 8
	needforfood = 1
	rarity = Rarity.COMMON
	super._init()
