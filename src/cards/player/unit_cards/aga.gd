extends AtakBirlik

class_name Aga

# Called when the node enters the scene tree for the first time.
func _init():
	info = "[Çoban], [Çiftçi], [Kağnıcı] yeteneklerinin hepsine sahiptir."
	base_atk = 4
	base_rng = 1
	max_health = 3
	needforfood = 2
	rarity = Rarity.LEGENDARY
	super._init()
