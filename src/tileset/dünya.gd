extends Node2D

@onready var tileArray = []
@onready var tileMap = $TileMap
@onready var objectPool = []
@onready var control = $Control

@onready var aga = preload("res://src/cards/player/unit_cards/KoyAgasi.tscn")
var aga_path = "res://src/cards/player/unit_cards/KoyAgasi.tscn" 

func _ready(): 
	for i in range(12): #basic tile
		tileArray.append(Vector2(4,0))
	for i in range(2): #
		tileArray.append(Vector2(0,0))
	for i in range(2):
		tileArray.append(Vector2(8,0))
	
	tileArray.shuffle()
	
	var counter = 0
	for i in tileMap.get_used_cells(0):
		tileMap.set_cell(0, i, 0,tileArray[counter])
		counter = counter + 1
	
	addObjectToPool(Vector2(-1,-1))
	addObjectToPool(Vector2(1,1))
<<<<<<< Updated upstream
		
	control.whenDrawed()
	
=======
>>>>>>> Stashed changes
	

func _input(event):
	if Input.is_action_just_pressed("click"):
		var clicked_cell = tileMap.local_to_map(tileMap.get_local_mouse_position())


func addObjectToPool( vector = Vector2(0,0) ):
	var pos = tileMap.map_to_local(vector)
	var globpos = $TileMap.to_global(pos)
	var instance = aga.instantiate()
	instance.position = globpos
	objectPool.append(instance)
	add_child(instance)
