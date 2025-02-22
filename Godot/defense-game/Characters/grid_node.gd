class_name GridNode
extends Node2D

@export_custom(PROPERTY_HINT_NONE, "suffix:px") var grid_step := 32.0
@export var grid_origin := Vector2(0,0)

func _ready() -> void:
	for child in get_children():
		if child is GridObject:
			child.initialize_grid(self)

func get_grid_position(grid_position: Vector2):
	for child in get_children():
		if child is GridObject && child.grid_position == grid_position:
			return child
	return null
