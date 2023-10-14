extends Node

#const initial_hand_size = 5
const initial_deck_size = 20
var numTiles = 16

var initial_deck = ["piyade","coban","efe","ciftci","koyun","ata","atli","sungulu","cocuk",
"tufekci","istihbaratci","keci","kurt","gorilla","ismetinonu","dinamike","berk","yigit","obama","firkateyn"]

var cur_deck_size
var level_map_units
var hand
var placements_tile

# Called when the node enters the scene tree for the first time.
func _ready():
	
	print("hi")
	randomize()
	hand = []
	cur_deck_size = initial_deck_size
	_set_initial_hand()
	_place_units()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass
	
	

func _level_start():
	pass
	
func _set_initial_hand(initial_hand_size = 5):
	
	cur_deck_size = initial_deck_size
	var cur_deck = initial_deck
	var card
	
	for i in range(initial_hand_size):
		card = cur_deck.pop_at( (int) (cur_deck_size * randf()) )
		hand.append(card)
		cur_deck_size -= 1
	
	for i in range(initial_hand_size):
		print(hand[i])
	
	pass
	
func _place_units():
	
	var placements = _pick_permutation( hand.size(), numTiles )	#according to hand
	placements_tile = []
	for i in range(numTiles):
		placements_tile.append(0)
	for i in range( 0, hand.size() ):
		placements_tile[placements[i]] = hand[i]
	
	print("placements in tiles:")
	for i in placements_tile:
		print(i)
	
	pass

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

func _pick_permutation_arr(r,n,arr):	# order in arr will not be preserved
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
