extends Node

@export var mob_scene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var chattyCustomer1 = mob_scene.instantiate()
	
	var customer_spawn_location = $ChattyCustomer1/ChattyCustomer1Location
	customer_spawn_location.progress_ratio = randf()
	#customer_spawn_location.progress_ratio = 0
	
	var direction = customer_spawn_location.rotation + PI / 2
	
	chattyCustomer1.position = customer_spawn_location.position
	
	direction += randf_range(-PI / 4, PI / 4)
	chattyCustomer1.rotation = direction
	
	var velocity = 100
	chattyCustomer1.linear_velocity = velocity.rotated(direction)
	
	add_child(chattyCustomer1)
	
	new_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func game_over() -> void:
	$DeliveryTime.stop
	
func new_game():
	$Player.start($StartPosition.position)
	$DeliveryTime.start()
	
	var chattyCustomer1 = mob_scene.instantiate()
	
	var customer_spawn_location = $ChattyCustomer1/ChattyCustomer1Location
	customer_spawn_location.progress_ratio = randf()
	#customer_spawn_location.progress_ratio = 0
	
	var direction = customer_spawn_location.rotation + PI / 2
	
	chattyCustomer1.position = customer_spawn_location.position
	
	direction += randf_range(-PI / 4, PI / 4)
	chattyCustomer1.rotation = direction
	
	var velocity = 100
	chattyCustomer1.linear_velocity = velocity.rotated(direction)
	
	add_child(chattyCustomer1)
	
