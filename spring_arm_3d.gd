extends SpringArm3D

@export var sensitivity = 0.005
@export_range(-90.0, 0.0, 1.0, "radians_as_degrees") var min_angle: float = -PI/2
@export_range(0.0, 90.0, 1.0, "radians_as_degrees") var max_angle: float = PI/2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.x -= event.relative.y * sensitivity
		rotation.x = clamp(rotation.x, min_angle, max_angle)
