extends Area2D
@export var speed = 500

func _ready():
	$Sprite2D.scale = Vector2(0,0)
	var tween = create_tween() #transiiton the value of an attribute in between
	tween.tween_property($Sprite2D, 'scale', Vector2(1,1), 0.35)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y -= speed * delta
