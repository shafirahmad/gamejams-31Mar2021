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
	
	

func game_over():
	if myscore > 100:
		show_message("You WIN!")
	else:
		show_message("Unfortunately you don't get the inheritance")
		
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "You have unexpectedly inherited a gazillion\n" \
	+ "dollars when your uncle suddenly passed away.\n\n" \
	+ "His will states that you have to pass a test first\n" \
	+ "before you are eligible for the funds.\n\n" \
	+ "Being an avid sailor, he has decreed that you navigate\n" \
	+ "the Suez canal and survive for more than 100 seconds.\n\n" \
	+ "Only then can you lay claim to the funds.\n\n" \
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
	pass # Replace with function body.


func _on_StartButton_pressed():
	$StartButton.hide()
	emit_signal("start_game")
	
	pass # Replace with function body.
