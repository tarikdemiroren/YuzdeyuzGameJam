extends Node2D

@onready var tileArray = []
@onready var tileMap = $TileMap

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
	

func _input(event):
	if Input.is_action_just_pressed("click"):
		var clicked_cell = tileMap.local_to_map(tileMap.get_local_mouse_position())


