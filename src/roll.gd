

extends Node

class_name GameManager

#const initial_hand_size = 5
const initial_deck_size = 20

class Tile:
	enum Terrain {FOG, SIMPLE, FARM, CAMOUFLAGE}
	var terrain : Terrain = Terrain.FOG
	var ui_location : Vector2i
	var unit
	func _init( loco : Vector2i):
		terrain = Terrain.FOG
		ui_location = loco

@onready var tiles : Array[Array] # 2d tile array

var available_tile_vectors : Array[Vector2i]

var initial_deck = ["piyade","coban","efe","ciftci","koyun","ata","atli","sungulu","cocuk",
"tufekci","istihbaratci","keci","kurt","gorilla","ismetinonu","dinamike","berk","yigit","obama","firkateyn"]

var cur_deck_size
var level_map_units
var hand : Array[UnitCards]
var placements_tiles # index tile sırasına göre unit isimleri tutuyor su an
var placements_units # index 

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("hi")
	randomize()
	
	_set_tile_and_terrain()
	
	cur_deck_size = initial_deck_size
	_set_initial_hand()
	_place_units()
	
	pass # Replace with function body.

func _set_tile_and_terrain():
	
	tiles = []
	for i in range(8):
		tiles.append(Array[Tile].new())
		for j in range(8):
			tiles[i].append(Tile.new(Vector2i(i-4,j-4)))
		
	for x in range(2,6):
		for y in range(2,6):
			var rando = randf()
			if rando < 0.8:
				tiles[x][y].terrain = Tile.Terrain.SIMPLE
			elif rando < 0.9:
				tiles[x][y].terrain = Tile.Terrain.FARM
			else:
				tiles[x][y].terrain = Tile.Terrain.CAMOUFLAGE
				
	available_tile_vectors = []
	for i in range(2,6):
		for j in range(2,6):
			available_tile_vectors.append(Vector2i(i,j))

func _set_initial_hand(initial_hand_size = 5):
	
	hand = []
	cur_deck_size = initial_deck_size
	var cur_deck = initial_deck
	
	for i in range(initial_deck_size):
		var rando = randf()
		if rando < 0.5:
			cur_deck.append(Tufekci.new())
		elif rando < 0.8:
			cur_deck.append(Topcu.new())
		else:
			cur_deck.append(Ciftci.new())
	
	var card
	for i in range(initial_hand_size):
		card = cur_deck.pop_at( (int) (cur_deck_size * randf()) )
		hand.append(card)
		cur_deck_size -= 1
	
	for i in range(initial_hand_size):
		print(hand[i])

func _place_units():
	var j : int = 0
	for vector in _pick_permutation_arr( hand.size(), available_tile_vectors.size(), available_tile_vectors ):	#according to hand
		hand[j].place_on((vector))
		j += 1
		tiles[vector.x][vector.y].unit = hand[j]

func _pick_permutation(r,n):
	if (r > n):
		print("impossible permutation request")
		return
		
	var arr = range(0,n)
	var result = []
	var randindex: int
	for i in range(r):
		randindex = (int) (n * randf())
		result.append(arr[randindex])
		arr[randindex] = arr[n-1]
		n -= 1
	return result
func _pick_permutation_arr(r,n,arr):	# order in arr may not be preserved
	if (r > n):
		print("impossible permutation request")
		return
	var result = []
	var randindex: int
	var tmp
	for i in range(r):
		randindex = (int) (n * randf())
		result.append(arr[randindex])
		tmp = arr[randindex]
		arr[randindex] = arr[n-1]
		arr[n-1] = tmp
		n -= 1
	return result

func _tile_explore(loco : Vector2i):
	available_tile_vectors.append(loco)
	var rando = randf()
	var tile : Tile = tiles[loco.x][loco.y]
	if rando < 0.8:
		tile.terrain = Tile.Terrain.SIMPLE
	elif rando < 0.9:
		tile.terrain = Tile.Terrain.FARM
	else:
		tile.terrain = Tile.Terrain.CAMOUFLAGE

