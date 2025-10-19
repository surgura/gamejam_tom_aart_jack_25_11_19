extends Node2D

class_name FloatingObject

@export var velocity = Vector2(100,30)

@onready var _start_position: Vector2 = global_position
@onready var _start_velocity: Vector2 = velocity
@onready var rocketSFX = $Rocket

var lowFps:int = 0

func _ready() -> void:
	Gamestate.ship = self
	rocketSFX.play() 

func reset() -> void:
	global_position = _start_position
	velocity = _start_velocity
	
func _physics_process(delta) -> void:
	if !Gamestate.is_paused:
		velocity += GravitySystem.gravity_at(position) * delta
		position += velocity * delta
		
		if (velocity != Vector2.ZERO) && (lowFps%10 == 0):
			look_at(global_position + velocity)
		lowFps += 1
