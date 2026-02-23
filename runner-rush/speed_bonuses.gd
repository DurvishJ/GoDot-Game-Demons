extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_energized_body_entered(body: Node2D) -> void:
	body.speed_boost(1.5, 3.0)
