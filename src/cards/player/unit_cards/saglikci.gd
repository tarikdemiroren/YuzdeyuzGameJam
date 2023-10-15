extends Birlik

class_name Saglikci

var heal_ability : int

# Called when the node enters the scene tree for the first time.
func _ready():
	info = "Komşu bir dost birliği 2 puan iyileştirir."
	max_health = 3
	heal_ability = 2
	needforfood = 1
	rarity = Rarity.RARE
	super._init()

func take_turn( neighs : Array[UnitCards] ):
	aim(neighs)

func aim( neighs : Array[UnitCards] ):
	neighs.shuffle()
	for neigh in neighs:
		if neigh is Birlik && neigh.cur_health < neigh.max_health:
			heal(neigh)
			break
			
func heal( target : UnitCards ):
	target.receive_healing(heal_ability)
	
