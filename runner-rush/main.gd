extends Node

@export var mob_scene: PackedScene
var score

func _ready() -> void:
	new_game()

func _process(_delta: float) -> void:
	pass

func new_game():
	score = 0
	$Player.start($StartPosition.position)
