extends Node2D

class_name FloatingObject

var velocity = Vector2(0,0)


func _physics_process(delta) -> void:
	velocity += GravitySystem.gravity_at(position) * delta
	position += velocity * delta
	
	if velocity != Vector2.ZERO:
		# For 2D, use look_at with a direction vector
		# The Vector2.UP is the 'up' direction for look_at, but you can use any vector
		look_at(global_position + velocity)
