# Autoload this as a singleton
extends Node

@export var GRAVITY_CONSTANT: float = 10000

var sources: Array[GravitySource] = []

func register_source(s):
	sources.append(s)

func unregister_source(s):
	sources.erase(s)

func gravity_at(pos: Vector2) -> Vector2:
	var force := Vector2.ZERO
	for s in sources:
		force += GRAVITY_CONSTANT * (s.root_position - pos).normalized() * s.mass / (s.root_position - pos).abs()
	return force
