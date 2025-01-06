extends CharacterBody2D
var speed = 500
var can_shoot: bool=true
signal laser(pos)

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * speed
	move_and_slide()
	
	#shooting 
	if Input.is_action_just_pressed("shoot") and can_shoot: #action just press = trigger once when the key is pressed
		laser.emit($LaserStartPos.global_position) #tracks where the node of LaserStartPos in scene - therefore it will contain the coordinates of its exact location
		can_shoot=false
		$LaserTimer.start() #allows the timer to restart
		$LaserSound.play()
func _on_laser_timer_timeout():
	can_shoot=true
