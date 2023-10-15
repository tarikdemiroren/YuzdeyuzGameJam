extends Control

@onready var first = $first_draft
@onready var second = $second_draft
@onready var third = $third_draft

@onready var ftex = $first_texture
@onready var stex = $second_texture
@onready var ttex = $third_texture

<<<<<<< Updated upstream
@onready var flabel = $first_label
@onready var slabel = $second_label
@onready var tlabel = $third_label

=======
>>>>>>> Stashed changes
var vecti = Vector2(110,120)

var legendaryTexture = preload("res://src/assets/legendaryCard.png")
var rareTexture = preload("res://src/assets/rareCard.png")
var normalTexture = preload("res://src/assets/cardBase.png")

<<<<<<< Updated upstream
var commanderTexture = [ preload("res://src/assets/commanderSprite.png"), "KUMANDAN"]
var efeTexture = [ preload("res://src/assets/efeSprite.png"), "EFE"]
var farmerTexture = [preload("res://src/assets/farmetSprite.png"), "ÇİFTÇİ"]
var intelTexture = [preload("res://src/assets/intelSprite.png"), "İSTİHBARATÇI"]
var kagniTexture = [preload("res://src/assets/kagniDriver.png"), "KAĞNI SÜRÜCÜSÜ"]
var littleOneTexture = [preload("res://src/assets/littleOneSprite.png"), "ÇOCUK ASKER"]
var mebusanTexture = [preload("res://src/assets/mebusanSprite.png"), "MECLİS ÜYESİ"]
var riflemanTexture = [preload("res://src/assets/rifleman.png"), "TÜFEKÇİ"]
var shepherdTexture = [preload("res://src/assets/shepherdSprite.png"), "ÇOBAN"]
var sihhiyeTexture = [preload("res://src/assets/sihhiyeSprite.png"), "DOKTOR"]
var sutcuImamTexture = [preload("res://src/assets/sutcuImamSprite.png"), "SÜTÇÜ İMAM"]
var topcuTexture = [preload("res://src/assets/topcuSprite.png"), "TOPÇU"]
var villageAgaTexture = [preload("res://src/assets/villageAga.png"), "KÖY AĞASI"]
var villagerTexture = [preload("res://src/assets/villagerSprite.png"), "KÖYLÜ"]
=======
var commanderTexture = preload("res://src/assets/commanderSprite.png")
var efeTexture = preload("res://src/assets/efeSprite.png")
var farmerTexture = preload("res://src/assets/farmetSprite.png")
var intelTexture = preload("res://src/assets/intelSprite.png")
var kagniTexture = preload("res://src/assets/kagniDriver.png")
var littleOneTexture = preload("res://src/assets/littleOneSprite.png")
var mebusanTexture = preload("res://src/assets/mebusanSprite.png")
var riflemanTexture = preload("res://src/assets/rifleman.png")
var shepherdTexture = preload("res://src/assets/shepherdSprite.png")
var sihhiyeTexture = preload("res://src/assets/sihhiyeSprite.png")
var sutcuImamTexture = preload("res://src/assets/sutcuImamSprite.png")
var topcuTexture = preload("res://src/assets/topcuSprite.png")
var villageAgaTexture = preload("res://src/assets/villageAga.png")
var villagerTexture = preload("res://src/assets/villagerSprite.png")
>>>>>>> Stashed changes

var textures = []

func _ready():
	textures.append(commanderTexture)
	textures.append(efeTexture)
	textures.append(farmerTexture)
	textures.append(intelTexture)
	textures.append(kagniTexture)
	textures.append(littleOneTexture)
	textures.append(mebusanTexture)
	textures.append(riflemanTexture)
	textures.append(shepherdTexture)
	textures.append(sihhiyeTexture)
	textures.append(sutcuImamTexture)
	textures.append(topcuTexture)
	textures.append(villageAgaTexture)
	textures.append(villagerTexture)

func textureChangeButton(texButton, texture):
	texButton.set_texture_normal(texture)

<<<<<<< Updated upstream
func changeText(text, texture):
	text.set_text(texture)

func textureChangeRect(tex, texture):
	tex.set_texture(texture)
	
func whenDrawed():
	textures.shuffle()
	textureChangeRect(ftex, textures[0][0])
	changeText(flabel, textures[0][1])
	textureChangeRect(stex, textures[1][0])
	changeText(slabel, textures[1][1])
	textureChangeRect(ttex, textures[2][0])
	changeText(tlabel, textures[2][1])

#func _on_first_label_pressed():
#
=======
#func changeText(text):

func textureChangeRect(tex, texture):
	tex.set_texture(texture)

func spriteSummon(unit1, unit2, unit3):
	var pos1 = first.position + vecti
	var instance1 = unit1.instantiate()
	instance1.scale = Vector2(1.5,1.5)
	instance1.position = pos1
	add_child(instance1)
	
	var pos2 = second.position + vecti
	var instance2 = unit2.instantiate()
	instance2.scale = Vector2(1.5,1.5)
	instance2.position = pos2
	add_child(instance2)
	
	var pos3 = third.position + vecti
	var instance3 = unit3.instantiate()
	instance3.scale = Vector2(1.5,1.5)
	instance3.position = pos3
	add_child(instance3)
	
func whenDrawed():
	textures.shuffle()
	textureChangeRect(ftex, textures[0])
	textureChangeRect(stex, textures[1])
	textureChangeRect(ttex, textures[2])
	
	
		
	
>>>>>>> Stashed changes
