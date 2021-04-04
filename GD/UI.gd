extends CanvasLayer

var myscore = 0

signal start_game

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()
	
func remove_rect():
	$ColorRect.hide()

func game_over():
	$ColorRect.show()
	if myscore > 100:
		show_message("You have inherited the TREASURE!\n\nYou are RICH!")
	else:
		show_message("Unfortunately you don't get the Treasure!\n\nYou can try again.")
	yield($MessageTimer, "timeout")
	$ColorRect.show()
	$StartButton.show()
	$MessageLabel.text = "You have unexpectedly inherited a treasure\n" \
	+ "chest when your uncle suddenly passed away.\n\n" \
	+ "His will states that you have to pass a sailing test\n" \
	+ "before you are eligible to receive it.\n\n" \
	+ "Being an avid sailor, he has decreed that you navigate\n" \
	+ "the Suez canal and survive for more than 100 seconds.\n\n" \
	+ "Only then can you lay claim to the treasure.\n\n" \
	+ "Good Luck Sailor\n\n" \
	+ "-----\n\n" \
	+ "Use Arrow Keys to Move"
	$MessageLabel.show()
	
	
func update_score(score):
	myscore = score
	$ScoreLabel.text = str(score)
	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_MessageTimer_timeout():
	$MessageLabel.hide()
	$ColorRect.hide()
	pass # Replace with function body.


func _on_StartButton_pressed():
	$StartButton.hide()
	$ColorRect.hide()
	emit_signal("start_game")
	
