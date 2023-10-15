extends AtakBirlik

class_name Efe

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "Öldürdüğü asker başına saldırı gücü 1 artar."
	base_atk = 2
	base_rng = 1
	max_health = 5
	needforfood = 1
	rarity = Rarity.RARE

func attack( target : UnitCards ):
	# animation or shit idk
	if target.take_damage(damage):
		base_atk += 1
