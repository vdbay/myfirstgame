extends Spatial

onready var camera1 = $InterpolatedCamera
onready var camera2 = $car/Camera

func _ready():
	pass


func _on_Button_pressed():
	if camera1.is_current():
		camera1.clear_current(true)
	elif camera2.is_current():
		camera2.clear_current(true)
