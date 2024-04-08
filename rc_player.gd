extends VehicleBody3D

const MAX_STEER = 0.4
const MAX_RPM = 300
const MAX_TORQUE = 200
const HORSE_POWER = 100

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func calc_engine_force(accel,rpm):
	return accel * MAX_TORQUE * (1 - rpm / MAX_RPM)
	
func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta*5)
	var accel = Input.get_axis("ui_down", "ui_up") * HORSE_POWER
	$backleft.engine_force = calc_engine_force(accel, abs($backleft.get_rpm()))
	$backright.engine_force = calc_engine_force(accel, abs($backright.get_rpm()))
	
	#TODO: mph label
	#TODO: right vehical
	#TODO: Chase camera
