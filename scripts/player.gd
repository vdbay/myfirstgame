extends "res://scripts/car.gd"

func get_input():
	var turn = Input.get_action_strength("ui_left")
	turn -= Input.get_action_strength("ui_right")
	steer_angle = turn * deg2rad(steering_limit)
	$Wheel_01_RR.rotation.y=steer_angle/2
	$Wheel_01_LR.rotation.y=steer_angle/2
	$Wheel_01_RF.rotation.y=0
	$Wheel_01_LF.rotation.y=0
	acceleration = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		acceleration = -transform.basis.z * engine_power
	if Input.is_action_pressed("ui_down"):
		acceleration = -transform.basis.z * braking
