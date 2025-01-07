extends Area2D
var speed : int
var rotation_speed:int
var direction_x:float
#var direction_y:float
signal collision
var can_collide:=true
func _ready():
	var rng := RandomNumberGenerator.new()
	
	#start position of the meteor 
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width) #random x position with a range of 0 and the width of the screen
	var random_y = rng.randi_range(-150,-50)
	
	#random graphic/texture
	var path: String = "res://PNG/Meteors/" + str(rng.randi_range(1,4)) + ".png"
	$MeteorGreyBig1.texture = load(path)
	#speed
	speed = rng.randi_range(400, 700)
	
	#direction
	direction_x = rng.randi_range(-1,1)
	#rotation speed
	rotation_speed=rng.randi_range(40,100)
	
	position = Vector2(random_x, random_y)
	
func _process(delta):
	position += Vector2(direction_x, 1.0) * speed * delta
	
	rotation_degrees = rotation_speed * delta
	
func _on_body_entered(_body):
	if can_collide:
		collision.emit()

#func to remove meteor if hit by laser 
func _on_area_entered(area):
	area.queue_free() #removing laser 
	$ZapSound.play()
	$MeteorGreyBig1.hide()
	can_collide = false
	await get_tree().create_timer(0.5).timeout
	queue_free() #removing the meteor
	pass # Replace with function body.
