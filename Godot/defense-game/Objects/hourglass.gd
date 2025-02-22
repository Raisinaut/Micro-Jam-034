extends Node2D

@onready var sand_top = $Glass/SandTop
@onready var sand_bottom = $Glass/SandBottom
@onready var sand_drip = $Glass/SandDrip

@onready var frame_count = sand_top.hframes

var sand_idx = 0


func _ready() -> void:
	SyncManager.tick.connect(progress_sand)

func progress_sand():
	if sand_idx >= frame_count-1:
		print("out of time")
		return
	sand_idx += 1
	sand_top.frame_coords.x = sand_idx
	sand_bottom.frame_coords.x = sand_idx
