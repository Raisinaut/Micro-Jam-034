extends GridCharacter

func _process(_delta: float) -> void:
	move_direction = Vector2.ZERO
	if Input.is_action_just_pressed("move_up"): move_direction.y -= 1
	if Input.is_action_just_pressed("move_down"): move_direction.y += 1
	if Input.is_action_just_pressed("move_left"): move_direction.x -= 1
	if Input.is_action_just_pressed("move_right"): move_direction.x += 1
	super(_delta)
