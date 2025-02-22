class_name GridCharacter
extends Node2D

@export var grid_position := Vector2(0,0)

var _grid_size = 100
var _grid_origin = Vector2(0,0)

func _ready() -> void:
	pass

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("move_up"): grid_position.y -= 1
	if Input.is_action_just_pressed("move_down"): grid_position.y += 1
	if Input.is_action_just_pressed("move_left"): grid_position.x -= 1
	if Input.is_action_just_pressed("move_right"): grid_position.x += 1
	update_position()

func update_position():
	position = (grid_position * _grid_size) + _grid_origin

func initialize_grid(grid_size: float, grid_origin: Vector2):
	_grid_size = grid_size
	_grid_origin = grid_origin
	update_position()
