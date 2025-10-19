@tool
extends Area2D

@export var mass_factor := 1.0

var _uniform_scale := 1.0

func _get_configuration_warnings() -> PackedStringArray:
	var warnings = PackedStringArray()
	if get_node_or_null("GravitySource") == null:
		warnings.append("This node requires a GravitySource child to function.")
	return warnings

@export var uniform_scale := 1.0:
	set(value):
		_uniform_scale = value
		scale = Vector2(value, value)
		var g := get_node("GravitySource") as GravitySource
		g.mass = mass_factor * value
	get:
		return _uniform_scale

func _ready():
	connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		self.uniform_scale += 0.5
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_RIGHT:
		self.uniform_scale -= 0.5
