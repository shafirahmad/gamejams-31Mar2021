extends Node

export (PackedScene) var BigShip
export (PackedScene) var Ship

var score
#signal bigship

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$BGMusic1.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func game_over():
	get_tree().call_group("ships", "queue_free")
	get_tree().call_group("bigships", "queue_free")
	$ScoreTimer.stop()
	$ShipTimer.stop()
	$UI.game_over()
	$OhOhSound.play()
	$BGMusic2.stop()
	$BGMusic1.play()

func new_game():
	score = 0
	$Player.start($PlayerStartPos.position)
	$StartTimer.start()
	$UI.show_message("Get Ready")
	$UI.update_score(score)
	$UI.remove_rect()
	$BGMusic2.play()
	$BGMusic1.stop()


func _on_ShipTimer_timeout():
	var ship = Ship.instance()
	add_child(ship)
	ship.position.x = rand_range(50, 350)
	ship.position.y = 0 
	#ship.linear_velocity = Vector2(0,rand_range(ship.min_speed, ship.max_speed))

func _on_ScoreTimer_timeout():
	score +=1
	$UI.update_score(score)


func _on_StartTimer_timeout():
	$ShipTimer.start()
	$ScoreTimer.start()
	$BigShipTimer.start()


func _on_BigShipTimer_timeout():
	var bigship = BigShip.instance()
	add_child(bigship)
	bigship.position.x = rand_range(100,300)
	bigship.position.y = -100
	#bigship.linear_velocity = Vector2(0,rand_range(bigship.min_speed, bigship.max_speed))
