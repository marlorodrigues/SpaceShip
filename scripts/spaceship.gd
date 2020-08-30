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
	set_position(get_position() + Vector2(0, 1) * speed * delta * (up + down))
	
	#Control X position
	set_position(get_position() + Vector2(1, 0) * speed * delta * (left + right))
	
	if Input.is_action_pressed("ui_shot"):
		if last_shot <= 0: 
			last_shot += intervel_between_shots
			var shotLeft = shot_model.instance()
			var shotRight = shot_model.instance()
			var positionShotY = get_position().y + get_node("LeftCannon/LeftPosition").get_position().y
			var positionShotX = get_position().x + get_node("LeftCannon/LeftPosition").get_position().x
			
			shotLeft.set_position(Vector2(positionShotX - 30, positionShotY))
			
			positionShotY = get_position().y + get_node("RightCannon/RightPosition").get_position().y
			positionShotX = get_position().x + get_node("RightCannon/RightPosition").get_position().x
			
			shotRight.set_position(Vector2(positionShotX + 30, positionShotY))
			
			get_node("../").add_child(shotLeft)
			get_node("../").add_child(shotRight)
			
	if last_shot > 0:
		last_shot -= delta
	
	pass
