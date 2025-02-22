extends Node2D

@onready var glass = $Offset/Glass
@onready var sand_top = $Offset/Glass/SandTop
@onready var sand_bottom = $Offset/Glass/SandBottom
@onready var sand_drip = $Offset/Glass/SandDrip
@onready var animator = $AnimationPlayer

@onready var frame_count = sand_top.hframes

var sand_idx = 0 : set = set_sand_idx


func _ready() -> void:
	SyncManager.tick.connect(progress_sand)

func progress_sand():
	if sand_idx >= frame_count-1:
		flip()
		return
	sand_idx += 1

func flip():
	animator.play("flip")
	await animator.animation_finished
	glass.rotation = 0
	sand_idx = 0

func set_sand_idx(idx):
	sand_idx = idx
	sand_top.frame_coords.x = sand_idx
	sand_bottom.frame_coords.x = sand_idx
