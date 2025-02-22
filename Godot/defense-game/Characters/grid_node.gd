class_name GridNode
extends Node2D

@export var grid_size := 100.0
@export var grid_origin := Vector2(0,0)

func _ready() -> void:
	for child in get_children():
		if child is GridCharacter:
			child.initialize_grid(grid_size, grid_origin)
