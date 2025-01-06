extends CanvasLayer
static var image = load("res://PNG/UI/playerLife1_blue.png")
var time_elapse := 0 
func set_health(amount):
	# remove all children
	for child in $MarginContainer2/HBoxContainer.get_children():
		child.queue_free() #deletes node

	#create new children amt set by health
	for i in amount:
		var text_rect = TextureRect.new()
		text_rect.texture=image
		text_rect.stretch_mode=TextureRect.STRETCH_KEEP
		$MarginContainer2/HBoxContainer.add_child(text_rect)
	print(amount)
	print('ui')


func _on_score_timer_timeout():
	time_elapse +=1
	$MarginContainer/Label.text = str(time_elapse)
	#increase score
	Global.score = time_elapse
