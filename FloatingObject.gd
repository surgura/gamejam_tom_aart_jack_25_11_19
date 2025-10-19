extends Node2D

class_name FloatingObject

var velocity = Vector2(0,0)
var lowFps:int = 0
@onready var rocketSFX = $Rocket

func _ready():
	rocketSFX.play() 

func _physics_process(delta) -> void:
	velocity += GravitySystem.gravity_at(position) * delta
	position += velocity * delta
	
	if (velocity != Vector2.ZERO) && (lowFps%10 == 0):
		look_at(global_position + velocity)
	lowFps += 1
