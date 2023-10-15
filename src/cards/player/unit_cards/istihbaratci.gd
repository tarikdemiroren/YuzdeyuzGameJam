extends Birlik

class_name Istihbaratci


# Called when the node enters the scene tree for the first time.
func _init():
	info = "Seçilen bir birlik ile yerini değişebilir."
	max_health = 4
	needforfood = 1
	rarity = Rarity.RARE
	super._init()
	

# click on this unit and another unit to swap their places

func swap_with( target : Birlik ):
	var tmp = grid_position
	grid_position = target.grid_position
	target.grid_position = tmp
	# still have to change tiles[][] in game manager
	
