extends Node2D

class_name FloatingObject

@export var velocity = Vector2(0,0)

@onready var _start_position: Vector2 = global_position
@onready var _start_velocity: Vector2 = velocity

func _ready() -> void:
	Gamestate.ship = self

func _physics_process(delta) -> void:
	if !Gamestate.is_paused:
		velocity += GravitySystem.gravity_at(position) * delta
		position += velocity * delta
		
		if velocity != Vector2.ZERO:
			# For 2D, use look_at with a direction vector
			# The Vector2.UP is the 'up' direction for look_at, but you can use any vector
			look_at(global_position + velocity)

func reset() -> void:
	global_position = _start_position
	velocity = _start_velocity
