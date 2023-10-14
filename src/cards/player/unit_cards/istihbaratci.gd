extends UnitCards

class_name Istihbaratcı


# Called when the node enters the scene tree for the first time.
func _ready():
	info = "Önceki turdaki asker ile şimdiki askere +1 saldırı güçlendirir"
	attackPower = 1
	health = 6
	rarity = Rareness.RARE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
