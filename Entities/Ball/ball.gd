extends CharacterBody2D

@export var initial_speed = 100
@export var speed_commulator = 50
var ball_speed = 0

var hitcounter = 0
var max_hitcounter = 12
var direction = Vector2()

var trail_length = 30
var trail

func _ready():
	ball_speed = initial_speed
	# should run this code for better rand
	randomize()
	
	trail = $Trail/Line2D
	trail.clear_points()

func set_start_direction():
	var random_x = 0
	
	if randf() < 0.5:
		random_x = 1
	else:
		random_x = -1
		
	direction = Vector2(random_x, randf_range(-1, 1))
	direction = direction.normalized() * ball_speed
	
func _physics_process(delta):
	if trail.points.size() > trail_length:
		trail.remove_point(0)
	trail.add_point(position)
	
	var collision = move_and_collide(direction * delta)
	
	if collision:
		direction = direction.bounce(collision.get_normal())
		
		if collision.get_collider().is_in_group("rackets"):
			
			var y = direction.y / 2 + collision.get_collider_velocity().y
			
			direction = Vector2(direction.x, y).normalized() * (ball_speed + (hitcounter * speed_commulator))
			
			if hitcounter < max_hitcounter:
				hitcounter += 1
				
			$RacketAudio.play()
		else:
			$WallAudio.play()
			
func reset():
	position = Vector2(512, 256)
	hitcounter = 0
	trail.clear_points()
	stop()
	
func stop():
	direction = Vector2()
