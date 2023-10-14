extends Node2D

class_name UnitCards

var cardSprite: Sprite2D
var classIcon: Sprite2D 
var selfIcon: Sprite2D
var info: String
#var attackPower: int
#var health: int

enum Rareness {LEGENDARY, RARE, ORDINARY}
var rarity: Rareness

enum Condition {	DIEHARD, 
					STUNNED, CONFUSED}
var conditions : Array[ConditionTuple]
var stat_buffs : Array[StatBuff]

var cur_health
var max_health
var isPlaced : bool
var grid_position : Vector2i

func _init():
	cur_health = max_health
	isPlaced = false
	conditions = []
	stat_buffs = []

func take_damage(damage : int):
	cur_health -= damage

func is_alive():
	return cur_health > 0
	
func place_on(pos : Vector2i):
	grid_position = pos
	isPlaced = true

func return_to_hand():
	isPlaced = false

func find_neighbors(range : int = 1):
	var neighs = []
	for x in range(-1*range,range+1):
		for y in range(-1*range,range+1):
			if grid_position.x + x in range(0,8) && grid_position.y + y in range(0,8):
				neighs.append(Vector2i(grid_position.x + x, grid_position.y + y))
			
	return neighs

class StatBuff:
	var duration : int
	var add_hp : int
	var scale_hp
	var add_atk : int
	var scale_atk
	var add_range : int
	func _init(t,ahp,shp,aatk,satk,arng):
		duration = t
		add_hp = ahp
		scale_hp = shp
		add_atk = aatk
		scale_atk = satk
		add_range = arng
	func tour_end():
		duration -= 1
		return duration

class ConditionTuple:
	var duration : int
	var condition : Condition
	func _init(t,c):
		duration = t
		condition = c
	func tour_end():
		duration -= 1
		return duration 

func stat_buff(duration : int, add_hp : int = 0, scale_hp = 1, add_atk : int = 0, scale_atk = 1, add_range : int = 0):
	stat_buffs.append( StatBuff.new(duration,add_hp,scale_hp,add_atk,scale_atk,add_range) )
	pass
	
func add_condition(condition : Condition, duration : int):
	conditions.append([condition,duration])

func tour_end():
	for stat_buff in stat_buffs:
		if stat_buff.tour_end() < 0:
			stat_buffs.erase(stat_buff)
	for cond in conditions:
		if cond.tour_end() < 0:
			conditions.erase(cond)
	pass
	
func take_turn():
	pass
