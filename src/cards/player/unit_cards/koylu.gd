extends AtakBirlik

class_name Koylu

var aga_counter : int

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "7 turun sonunda [Ağa] olarak geri döner."
	base_atk = 1
	base_rng = 1
	max_health = 7
	needforfood = 1
	rarity = Rarity.COMMON
	
	aga_counter = 7	
	
func tour_end():
	super.tour_end()
	aga_counter -= 1
	if aga_counter <= 0:
		isDefeated = true
		
