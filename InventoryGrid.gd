extends GridContainer
class_name InventoryGrid

@export var rows: int 
@export var panel: Node
@export var panelSize: float
@export var margin: int 

var grid = []

func resize():
	self.add_theme_constant_override("h_separation", margin)
	self.add_theme_constant_override("v_separation", margin)
	self.size.x = columns * panelSize + ((columns - 1) * margin)
	self.size.y = rows * panelSize + ((rows - 1) * margin)
	panel.name = "0"
	
	for i in range(1, (rows * columns)):
		var newpanel = panel.duplicate()
		newpanel.name = str(i)
		add_child(newpanel)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	resize()
	grid.resize(rows * columns)
	print(grid)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
