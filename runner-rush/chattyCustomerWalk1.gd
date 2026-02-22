extends PathFollow2D

@onready var sprite = $AnimatedSprite2D

var walkSpeed = 75

func _ready():
	print("I exist")
	print(sprite)
	print(sprite.global_position)
	sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += delta * walkSpeed
