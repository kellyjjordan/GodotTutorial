extends Control

@export var level_scene = load("res://level.tscn")

func _ready():
	$gameover_sound.play()
	$CenterContainer/VBoxContainer/scoreLabel.text = $CenterContainer/VBoxContainer/scoreLabel.text + str(Global.score)
	
func _process(_delta:):
	if Input.is_action_just_pressed('shoot'):
		get_tree().change_scene_to_packed(level_scene)
