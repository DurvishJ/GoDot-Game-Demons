extends PathFollow2D

@onready var sprite = $AnimatedSprite2D

var walkSpeed = 0.05

func _ready():
	sprite.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	progress_ratio += walkSpeed * delta
