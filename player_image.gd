extends CharacterBody2D
var speed = 500

# Called when the node enters the scene tree for the first time.
func _ready():
	position = Vector2(100,500)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var direction = Input.get_vector("left","right","up","down")
	velocity = direction * 500
	move_and_slide()
	
