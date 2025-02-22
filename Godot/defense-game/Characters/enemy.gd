extends GridCharacter

var target = Vector2.ZERO

func _ready() -> void:
	SyncManager.tick.connect(_move_towards_target)

func _move_towards_target():
	move_direction = round(_grid_position.direction_to(target))
	if move_direction.x != 0 && move_direction.y != 0:
		move_direction.x = 0
