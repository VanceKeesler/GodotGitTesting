extends CharacterBody3D

@export var string = "hihihihihihihihi"

@export var SPEED = 5.0
@export var JUMP_VELOCITY = 4.5

@onready var camera = $SpringArm3D

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		rotation.y -= event.relative.x * camera.sensitivity
		rotation.y = wrapf(rotation.y, 0.0, 2*PI)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	var direction = Vector3.ZERO
	var forward = -camera.global_basis.z
	forward.y = 0
	forward = forward.normalized()
	
	if Input.is_action_pressed("move_forward"):
		direction += forward
	if Input.is_action_pressed("move_back"):
		direction += -forward
	if Input.is_action_pressed("move_left"):
		direction += -forward.cross(Vector3.UP)
	if Input.is_action_pressed("move_right"):
		direction =+ forward.cross(Vector3.UP)
	
	
	
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
