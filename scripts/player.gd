extends "res://scripts/car.gd"

func get_input():
	var turn = Input.get_action_strength("ui_left")
	turn -= Input.get_action_strength("ui_right")
	steer_angle = turn * deg2rad(steering_limit)
	$Wheel_01_RF.rotation.y=deg2rad(180)+(steer_angle)
	$Wheel_01_LF.rotation.y=deg2rad(180)+(steer_angle)
	$Wheel_01_RR.rotation.y=deg2rad(180)
	$Wheel_01_LR.rotation.y=deg2rad(180)
	acceleration = Vector3.ZERO
	if Input.is_action_pressed("ui_up"):
		acceleration = -transform.basis.z * engine_power
	if Input.is_action_pressed("ui_down"):
		acceleration = -transform.basis.z * braking
	if Input.is_action_pressed("brake"):
		velocity = Vector3.ZERO


func _on_Area_body_entered(body):
	if body.name == "car":
		print("hit!")
		get_tree().change_scene("res://win.tscn")
	elif body.name == "car2":
		print("you lose")
		get_tree().change_scene("res://lose.tscn")
