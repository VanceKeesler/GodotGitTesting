extends Control
class_name InventoryItem

@export var width: int
@export var height: int
@export var texture: TextureRect
@export var grid: InventoryGrid
var grabbed := false
var rotated := false
var old_pos = Vector2(0, 0)
var attached_grid = grid

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _gui_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			grabbed = true
			old_pos = global_position
			z_index = 10
			global_position = get_global_mouse_position() - size * 0.5
