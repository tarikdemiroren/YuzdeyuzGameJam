extends Node2D

class_name TacticalCards

var cardSprite: Sprite2D
var classIcon: Sprite2D 
var selfIcon: Sprite2D
var info: String
var attackPower: int
var health: int
enum Rareness {LEGENDARY, RARE, ORDINARY}
var rarity: Rareness


func _init():
	pass

