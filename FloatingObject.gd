extends Node2D

class_name FloatingObject

var velocity = Vector2(0,0)


func _physics_process(delta) -> void:
	velocity += GravitySystem.gravity_at(position) * delta
	position += velocity * delta
