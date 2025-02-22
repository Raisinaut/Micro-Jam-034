class_name GridCharacter
extends Node2D

var _grid_step = 100
var _grid_origin = Vector2(0,0)
var _grid_position = Vector2(0,0)

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_up"): _grid_position.y -= 1
	if Input.is_action_just_pressed("move_down"): _grid_position.y += 1
	if Input.is_action_just_pressed("move_left"): _grid_position.x -= 1
	if Input.is_action_just_pressed("move_right"): _grid_position.x += 1
	update_position()

func update_position():
	position = (_grid_position * _grid_step) + _grid_origin

func initialize_grid(grid_size: float, grid_origin: Vector2):
	_grid_step = grid_size
	_grid_origin = grid_origin
	_grid_position = (position - _grid_origin) / _grid_step
	update_position()
