extends Node2D

var speed_shot = 400

# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if get_position().y < -375:
		queue_free()
	
	set_position(get_position() + Vector2(0, -1) * delta * speed_shot)
	
	pass
