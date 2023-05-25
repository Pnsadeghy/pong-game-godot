extends Camera2D

var is_shaking = false
var initialPosition: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	initialPosition = position

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_shaking:
		var randomOffset = Vector2(randf_range(-1, 1), randf_range(-1, 1)) * 5
		position = initialPosition + randomOffset

func on_shake():
	is_shaking = true
	$Timer.start()


func _on_timer_timeout():
	is_shaking = false
