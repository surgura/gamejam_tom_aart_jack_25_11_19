extends Node2D

class_name FloatingObject

@export var MASS: float = 1.0

var velocity = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta) -> void:
	var gravity_f = Vector2(1.0, 0.0) * 10
	velocity += gravity_f / MASS
	position += velocity * delta
