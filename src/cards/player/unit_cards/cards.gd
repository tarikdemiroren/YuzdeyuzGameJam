extends Node2D

class_name UnitCards

var cardSprite: Sprite2D
var classIcon: Sprite2D 
var selfIcon: Sprite2D
var info: String
var attackPower: int
var health: int
enum Rareness {LEGENDARY, RARE, ORDINARY}
var rarity: Rareness
var mapPositions

func _ready() -> void:
	set_health_label()
	

func takeDamage(damage):
	if health > damage:
		health = health - damage
	else:
		self.queue_free()
		
func attackCharacters():
	pass
	
func setMapPosition(pos) -> void:
	mapPositions = pos

func set_health_label() -> void:
	$HealthLabel.text = "%s" % health
	
