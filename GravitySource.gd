class_name GravitySource
extends Node2D

@export var mass := 1.0

var root_position: Vector2:
	get:
		return global_position

func _enter_tree():
	GravitySystem.register_source(self)

func _exit_tree():
	GravitySystem.unregister_source(self)
