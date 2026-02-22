extends Node

@export var mob_scene: PackedScene
@onready var timer = $DeliveryTime
@onready var timerLabel = $CanvasLayer/Timer
@onready var gameOver = $CanvasLayer/GameOver

var elapsed_time = 0.0

func _ready() -> void:
	new_game()

func _process(delta: float) -> void:
	if elapsed_time >= 45:
		gameOver.text = "You lose"
		get_tree().paused = true
	else:
		elapsed_time += delta
		timerLabel.text = "%.2f" % elapsed_time
	

func new_game():
	$DeliveryTime.start()
	$Player.start($StartPosition.position)


func _on_finish_body_entered(body: Node2D) -> void:
	if elapsed_time > 45:
		gameOver.text = "You lose"
	else:
		gameOver.text = "You win!"
	get_tree().paused = true


func _on_chatty_customer_hit() -> void:
	gameOver.text = "You lose"
	get_tree().paused = true
