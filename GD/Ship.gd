extends RigidBody2D

export var min_speed = 80  # Minimum speed range.
export var max_speed = 150  # Maximum speed range.
var myspeed = 0

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	var ship_types = $AnimatedSprite.frames.get_animation_names()
	#print_debug(ship_types)
	$AnimatedSprite.animation = ship_types[randi() % (ship_types.size()-1)]
	scale.x = 5
	scale.y = 5
	if rand_range(1,100) > 90:
		$AnimatedSprite.animation = ship_types[ship_types.size()-1]
		scale.x = 1
		scale.y = 1
	position.y = 150
	position.x = 200
	$AnimatedSprite.flip_v = 1
	myspeed = rand_range(min_speed, max_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#scale.x = 5
	#scale.y = 5
	position.y += delta*myspeed




func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
