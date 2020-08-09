extends Node2D

var speed = 300
var intervel_between_shots = 0.3
var last_shot = 0
var shot_model = preload('res://scenes/shot.tscn')

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	var up = 0
	var down = 0
	var left = 0
	var right = 0
	
	if Input.is_action_pressed("ui_up"):
		up = -1
		
	if Input.is_action_pressed("ui_down"):
		down = 1
	
	if Input.is_action_pressed("ui_right"):
		right = 1
		
	if Input.is_action_pressed("ui_left"):
		left = -1
	
	if get_position().x > 248:
		right = 0
	
	if get_position().x < -240:
		left = 0
	
	if get_position().y < -370:
		up = 0
		
	if get_position().y > 0:
		down = 0
	
	#Control Y position
	set_position(get_position() + Vector2(0, speed) * delta * (up + down))
	
	#Control X position
	set_position(get_position() + Vector2(speed, 0) * delta * (left + right))
	
	if Input.is_action_pressed("ui_shot"):
		if last_shot <= 0: 
			var shot = shot_model.instance()
			shot.set_position(get_position())
			get_node("../").add_child(shot)
			last_shot += intervel_between_shots
			
	if last_shot > 0:
		last_shot -= delta
	
	print(delta)
	pass
