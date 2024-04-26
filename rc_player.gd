extends VehicleBody3D

const MAX_STEER = 0.4
const MAX_RPM = 300
const MAX_TORQUE = 200
const HORSE_POWER = 100

@onready var audio_player = $AudioStreamPlayer3D
var moving = preload("res://assets/sounds/transport_car_drive_fast_race_engine_perspective.mp3")
var idle = preload("res://assets/sounds/zapsplat_vehicles_car_diesel_engine_idle_close_under_engine_nissan_patrol_1998_67744.mp3")


func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func calc_engine_force(accel,rpm):
	return accel * MAX_TORQUE * (1 - rpm / MAX_RPM)
	
func _physics_process(delta):
	steering = lerp(steering, Input.get_axis("ui_right", "ui_left") * MAX_STEER, delta*5)
	var accel = Input.get_axis("ui_down", "ui_up") * HORSE_POWER
	$backleft.engine_force = calc_engine_force(accel, abs($backleft.get_rpm()))
	$backright.engine_force = calc_engine_force(accel, abs($backright.get_rpm()))
	if accel > 0:
		if audio_player.playing:
			await audio_player.finished
		audio_player.stream = moving if accel <= 0 else idle
		audio_player.play()
		
	
	var fwd_mps = abs((self.linear_velocity * self.transform.basis).z)
	$Label.text = "%d mph" % (fwd_mps * 2.23694)
	
	$centerMass.global_position = $centerMass.global_position.lerp(self.global_position, delta * 20.0)
	$centerMass.transform = $centerMass.transform.interpolate_with(self.transform, delta * 5.0)
	$centerMass/Camera3D.look_at(self.global_position.lerp(self.global_position + self.linear_velocity, delta * 5.0))
	check_and_right_vehicle()

func check_and_right_vehicle():
	if self.global_transform.basis.y.dot(Vector3.UP) < 0:
		var current_rotation = self.rotation_degrees
		current_rotation.x = 0 #reset pitch
		current_rotation.z = 0 #reset roll
		self.rotation_degrees = current_rotation
