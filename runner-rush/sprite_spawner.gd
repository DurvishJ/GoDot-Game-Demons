extends Node2D

@onready var rect1 = $FirstSpawnLocation
@onready var rect2 = $SecondSpawnLocation
@onready var rect3 = $ThirdSpawnLocation
@onready var rect4 = $FourthSpawnLocation
@onready var rect5 = $FifthSpawnLocation
@onready var rect6 = $SixthSpawnLocation



var bonus_scenes = [
	preload("res://energized.tscn"),
	preload("res://rollerblades.tscn"),
	preload("res://rat.tscn"),
	preload("res://slippy_floors.tscn")
]

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	randomize()
	spawn_bonuses()

func spawn_bonuses():
	for i in range(3):
		var random_scene1 = bonus_scenes.pick_random()
		var bonus1 = random_scene1.instantiate()
		
		bonus1.position = get_random_position1()
		
		add_child(bonus1)
		
	for i in range(3):
		var random_scene = bonus_scenes.pick_random()
		var bonus = random_scene.instantiate()
		
		bonus.position = get_random_position2()
		
		add_child(bonus)
	
	for i in range(3):
		var random_scene = bonus_scenes.pick_random()
		var bonus = random_scene.instantiate()
		
		bonus.position = get_random_position3()
		
		add_child(bonus)
	
	for i in range(3):
		var random_scene = bonus_scenes.pick_random()
		var bonus = random_scene.instantiate()
		
		bonus.position = get_random_position4()
		
		add_child(bonus)
		
	for i in range(3):
		var random_scene = bonus_scenes.pick_random()
		var bonus = random_scene.instantiate()
		
		bonus.position = get_random_position5()
		
		add_child(bonus)
	
	for i in range(3):
		var random_scene = bonus_scenes.pick_random()
		var bonus = random_scene.instantiate()
		
		bonus.position = get_random_position6()
		
		add_child(bonus)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func get_random_position1():
	var size = rect1.size
	var origin = rect1.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)
	
func get_random_position2():
	var size = rect2.size
	var origin = rect2.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)

func get_random_position3():
	var size = rect3.size
	var origin = rect3.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)

func get_random_position4():
	var size = rect4.size
	var origin = rect4.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)

func get_random_position5():
	var size = rect5.size
	var origin = rect5.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)

func get_random_position6():
	var size = rect6.size
	var origin = rect6.global_position
	
	return Vector2(
		randf_range(origin.x, origin.x + size.x),
		randf_range(origin.y, origin.y + size.y)
	)
