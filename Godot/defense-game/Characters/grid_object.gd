class_name GridObject
extends Node2D

@export var vulnerable := false
@export var health := 0
@export var contact_damage := 0

var _grid = null

var grid_position = Vector2.ZERO
var move_direction = Vector2.ZERO

func initialize_grid(grid: GridNode):
	_grid = grid
	grid_position = round((position - _grid.grid_origin) / _grid.grid_step)
	_update_position(1)

func _process(delta: float) -> void:
	grid_position += move_direction
	move_direction = Vector2.ZERO
	_update_position(delta)

func _update_position(delta: float):
	position = lerp(position, _actual_position(), delta * 20)

func move(direction: Vector2):
	if direction == Vector2.ZERO: return
	direction = grid_round(direction)
	var object = _grid.get_grid_position(grid_position + direction)
	if !object:
		move_direction = direction
	else:
		take_damage(object.contact_damage)
		object.take_damage(contact_damage)
		_bonk(direction)
		move_direction = Vector2.ZERO

func _actual_position():
	return (grid_position * _grid.grid_step) + _grid.grid_origin

func _bonk(direction: Vector2):
	if direction == Vector2.ZERO: return
	var bonk = direction * _grid.grid_step * 0.1
	var t = create_tween()
	t.tween_property(self, 'position', _actual_position() + bonk, 0.05)
	t.tween_property(self, 'position', _actual_position(), 0.05)

func take_damage(amount: int):
	if !vulnerable: return
	health -= amount
	if health <= 0: die()

func die():
	queue_free()

func grid_round(vec: Vector2):
	vec = round(vec.normalized())
	if vec.x != 0 && vec.y != 0: vec.x = 0
	return vec
