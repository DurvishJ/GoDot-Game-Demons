extends PathFollow2D

@onready var sprite = $chattyCustomer1/AnimatedSprite2D

var walkSpeed = 0.05

func _ready():
	progress_ratio = 0.5
	sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += walkSpeed * delta
	
	if progress_ratio > 0.5:
		$chattyCustomer1/AnimatedSprite2D.flip_h = true
	else:
		$chattyCustomer1/AnimatedSprite2D.flip_h = false
