extends AtakBirlik

class_name Tufekci

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "İki birim uzağına kadar saldırabilir."
	base_atk = 2
	base_rng = 2
	max_health = 5
	needforfood = 1
	rarity = Rarity.COMMON
