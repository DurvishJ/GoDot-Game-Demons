extends Node

@export var mob_scene: PackedScene
@onready var timer = $DeliveryTime
@onready var timerLabel = $CanvasLayer/Timer
@onready var gameOver = $CanvasLayer/GameOver
@onready var start_button = $CanvasLayer/StartButton

var elapsed_time = 0.0

func _ready() -> void:
	get_tree().paused = true # This freezes everything initially


func _process(delta: float) -> void:
	if elapsed_time >= 45:
		$LoseGame.play()
		gameOver.text = "You lose"
		get_tree().paused = true
	else:
		elapsed_time += delta
		timerLabel.text = "%.2f" % elapsed_time
	
func new_game():
	get_tree().paused = false  # This "wakes up" the timer and customers
	elapsed_time = 0.0         # Resets the clock to 0.00
	gameOver.text = ""
	$DeliveryTime.start()
	$Player.start($StartPosition.position)
	$Music.play()


func _on_finish_body_entered(body: Node2D) -> void:
	get_tree().paused = true
	if elapsed_time > 45:
		$LoseGame.play()
		gameOver.text = "You lose"
	else:
		gameOver.text = "You win!"
		
	await get_tree().create_timer(2.0).timeout
	
	start_button.text = "Play Again"
	start_button.show()
	$CanvasLayer/BlurBackground.show()
	
	get_tree().paused = true


func _on_chatty_customer_hit() -> void:
	get_tree().paused = true
	$LoseGame.play()
	gameOver.text = "You lose"
	
	await get_tree().create_timer(2.0).timeout
	
	start_button.text = "Play Again"
	start_button.show()
	$CanvasLayer/BlurBackground.show()
	

	
	
func _on_start_button_pressed() -> void:
	# If the button says "Play Again", reload everything
	if start_button.text == "Play Again":
		get_tree().paused = false 
		get_tree().reload_current_scene()
	else:
		# If it's the very first start, just run the normal start logic
		start_button.hide()
		$CanvasLayer/BlurBackground.hide()
		new_game()


	
