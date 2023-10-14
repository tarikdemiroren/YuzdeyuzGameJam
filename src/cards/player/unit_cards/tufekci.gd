extends UnitCards

class_name Tufekci

var base_atk : int
var base_rng : int

# Called when the node enters the scene tree for the first time.
func _init():
	super._init()
	info = "İki birim uzağına kadar saldırabilir."
	base_atk = 2
	base_rng = 2
	max_health = 5
	rarity = Rareness.ORDINARY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func takes_turn():
	# attack random enemy in sight
	var neighs = super.find_neighbors(base_rng) # vector2i array
	
	for neigh in neighs:
		if game_map.getUnitOnLocation(neigh) is Dusman:
			hit(neigh)
	pass

func hit( enemy : Dusman ):
	pass
