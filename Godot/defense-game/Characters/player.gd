extends GridCharacter

func _process(_delta: float) -> void:
	var direction = Vector2.ZERO
	if Input.is_action_just_pressed("move_up"): direction.y -= 1
	if Input.is_action_just_pressed("move_down"): direction.y += 1
	if Input.is_action_just_pressed("move_left"): direction.x -= 1
	if Input.is_action_just_pressed("move_right"): direction.x += 1
	move(direction)
	super(_delta)
