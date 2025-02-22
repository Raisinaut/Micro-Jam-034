class_name GridObject
extends Node2D

var _grid = null

var grid_position = Vector2.ZERO

func initialize_grid(grid: GridNode):
	_grid = grid
	grid_position = round((position - _grid.grid_origin) / _grid.grid_step)
	_update_position(1)

func _actual_position():
	return (grid_position * _grid.grid_step) + _grid.grid_origin

func _update_position(delta: float):
	position = lerp(position, _actual_position(), delta * 20)
