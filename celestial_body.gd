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

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
