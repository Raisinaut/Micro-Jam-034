class_name GridCharacter
extends GridObject

var move_direction = Vector2.ZERO

func _process(delta: float) -> void:
	_move()
	_update_position(delta)

func _move():
	if !_grid.get_grid_position(grid_position + move_direction):
		grid_position += move_direction
	else:
		_bonk(move_direction)
	move_direction = Vector2.ZERO

func _bonk(direction: Vector2):
	if direction == Vector2.ZERO: return
	var bonk = direction * _grid.grid_step * 0.1
	var t = create_tween()
	t.tween_property(self, 'position', _actual_position() + bonk, 0.05)
	t.tween_property(self, 'position', _actual_position(), 0.05)
