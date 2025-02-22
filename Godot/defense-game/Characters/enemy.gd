extends GridCharacter

var target = Vector2.ZERO

func _ready() -> void:
	SyncManager.tick.connect(_move_towards_target)

func _move_towards_target():
	move(grid_round(grid_position.direction_to(target)))
