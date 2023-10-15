extends Node2D

class_name UnitCards

var cardSprite: Sprite2D
var classIcon: Sprite2D 
var selfIcon: Sprite2D
var info: String
#var attackPower: int
#var health: int

var stat_buffs : Array[StatBuff]
enum Condition {STUNNED, DIEHARD, CONFUSED}

# these change with buffs
var cur_hp : int
var max_hp : int

var cur_health : int
var max_health : int
var isPlaced : bool
var grid_position : Vector2i

var stunned : int
var confused : int
var diehard : int
var isDefeated : bool

func _init():
	cur_health = max_health
	isPlaced = false
	isDefeated = false
	stat_buffs = []

func take_damage(damage : int):
	cur_hp -= damage
	cur_health = cur_hp
	max_hp = max_health
	
	if cur_health <= 0 && diehard <= 0:
		isDefeated = true
		
	return isDefeated # true if defeated
	
func receive_healing(heal : int):
	cur_hp += heal
	cur_health += heal
	if cur_hp > max_hp:
		cur_hp = max_hp
		cur_health = max_health
	
func is_healthy():
	return cur_health > 0
	
func place_on(pos : Vector2i):
	grid_position = pos
	isPlaced = true

func return_to_hand():
	isPlaced = false
	
func return_to_abyss():
	isDefeated = true

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

func stat_buff(duration : int, add_hp : int = 0, scale_hp = 1, add_atk : int = 0, scale_atk = 1, add_range : int = 0):
	stat_buffs.append( StatBuff.new(duration,add_hp,scale_hp,add_atk,scale_atk,add_range) )
	pass
	
func add_condition(condition : Condition, duration : int):
	if condition == Condition.STUNNED && duration > stunned:
		stunned = duration
	elif condition == Condition.CONFUSED && duration > confused:
		confused = duration
	elif condition == Condition.DIEHARD && duration > diehard:
		diehard = duration

func tour_end():
	for stat_buff in stat_buffs:
		if stat_buff.tour_end() < 0:
			stat_buffs.erase(stat_buff)
	stunned -= 1
	confused -= 1
	diehard -= 1
	pass
	
func take_turn( neighbors : Array[UnitCards] ):
	pass
	
func run_buffs():
	cur_hp = cur_health
	max_hp = max_health
	
	if stat_buffs.is_empty():
		return
	
	for buff in stat_buffs:
		max_hp *= buff.scale_hp
		max_hp += buff.add_hp
		cur_hp = max_hp - max_health + cur_health
