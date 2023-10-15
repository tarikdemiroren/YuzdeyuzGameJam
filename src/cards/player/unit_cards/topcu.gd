extends AtakBirlik

class_name Topcu

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "İki birim uzağına kadar yüksek hasar ile saldırabilir."
	base_atk = 4
	base_rng = 2
	max_health = 4
	needforfood = 1
	rarity = Rarity.RARE
