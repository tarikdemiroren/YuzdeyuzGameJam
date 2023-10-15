extends UnitCards

class_name KoyAgasi

func _ready():
	info = "Etraftaki Her Birimi Bir Kere Daha Aktif Et"
	attackPower = 3
	health = 12
	rarity = Rareness.RARE

func setMapPosition(pos):
	mapPositions = pos
