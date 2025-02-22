class_name GridCharacter
extends Node2D

var _grid_step = 100
var _grid_origin = Vector2(0,0)
var _grid_position = Vector2(0,0)
var move_direction = Vector2(0,0)

func _process(delta: float) -> void:
	move()
	update_position(delta)

func move():
	_grid_position += move_direction
	move_direction = Vector2.ZERO

func update_position(delta: float):
	position = lerp(position, (_grid_position * _grid_step) + _grid_origin, delta * 20)

func initialize_grid(grid_size: float, grid_origin: Vector2):
	_grid_step = grid_size
	_grid_origin = grid_origin
	_grid_position = (position - _grid_origin) / _grid_step
	update_position(0)
