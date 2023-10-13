extends Node2D

class_name Cards

var cardSprite: Sprite2D
var classIcon: Sprite2D 
var selfIcon: Sprite2D
var info: String
var attackPower: int
var health: int
enum Rareness {LEGENDARY, RARE, ORDINARY}
var rarity: Rareness

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
