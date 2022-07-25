extends RigidDynamicBody2D

var FLAP_FORCE = -340
var started = false
var rotation_degrees = rotation
const MAX_ROTATION_DEGREES = -30.0


func _physics_process(delta):
	if Input.is_action_just_pressed("fly"):
		if !started:
			start()
		flap()
	if rotation_degrees <= MAX_ROTATION_DEGREES:
		angular_velocity = 0
		rotation_degrees = MAX_ROTATION_DEGREES
	
	if linear_velocity.y > 0:
		if rotation_degrees <= 90:
			angular_velocity = 5
		else:
			angular_velocity = 0
func start():
	if started: return
	started = true
	gravity_scale = 1.0
func flap():
	linear_velocity.y = FLAP_FORCE
	angular_velocity = -8.0
