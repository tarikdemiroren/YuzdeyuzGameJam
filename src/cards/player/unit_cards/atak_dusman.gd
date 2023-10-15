extends Dusman

class_name AtakDusman

var base_atk : int
var base_rng : int

# these change with buffs debuffs
var damage : int
var range : int

func run_buffs():
	damage = base_atk
	cur_hp = cur_health
	max_hp = max_health
	range = base_rng
	
	if stat_buffs.is_empty():
		return
	
	for buff in stat_buffs:
		# atk
		damage *= buff.scale_atk
		damage += buff.add_atk
		# hp
		max_hp *= buff.scale_hp
		max_hp += buff.add_hp
		cur_hp = max_hp - max_health + cur_health
		# range
		range += buff.add_range 

func aim( neighs : Array[UnitCards] ):
	if confused:
		confused_aim(neighs)
		return

	neighs.shuffle()
	for neigh in neighs:
		if neigh is Birlik:
			attack(neigh)
			break

func confused_aim( neighs : Array[UnitCards] ):
	neighs.shuffle()
	for neigh in neighs:
		attack(neigh)
		break

func attack( target : UnitCards ):
	# animation or shit idk
	target.take_damage(damage)
	
func take_turn( neighs : Array[UnitCards] ):
	aim(neighs)

