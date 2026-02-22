extends CharacterBody2D # 1. Change this line

signal hit

@export var speed = 150 
var screen_size 

func _ready():
	screen_size = get_viewport_rect().size

# 2. Use _physics_process for better collision handling
func _physics_process(delta): 
	var input_velocity = Vector2.ZERO 
	if Input.is_action_pressed("move_right"):
		input_velocity.x += 1
	if Input.is_action_pressed("move_left"):
		input_velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		input_velocity.y += 1
	if Input.is_action_pressed("move_up"):
		input_velocity.y -= 1

	if input_velocity.length() > 0:
		# 3. Use the built-in 'velocity' property
		velocity = input_velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.stop()
		
	# 4. Use move_and_slide() instead of position += ...
	move_and_slide() 
	
	# Keep the player within the screen
	global_position = global_position.clamp(Vector2.ZERO, screen_size)
	
	# Animation flipping code...
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "walk"
		$AnimatedSprite2D.flip_h = velocity.x < 0

func start(pos):
	global_position = pos # Moves player to the start point
	show() # Makes player visible
	$CollisionShape2D.disabled = false # Enables collision
