extends UnitCards

class_name CocukAsker

# Called when the node enters the scene tree for the first time.
func _ready():
	info = "İstediğin bir asker ile yerini değiştir"
	attackPower = 0
	health = 5
	rarity = Rareness.ORDINARY


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
