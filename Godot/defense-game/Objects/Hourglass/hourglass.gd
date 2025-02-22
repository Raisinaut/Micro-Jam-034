extends GridObject

@export var progress_curve : Curve

@onready var glass = $Offset/Glass
@onready var sand_top = $Offset/Glass/SandTop
@onready var sand_bottom = $Offset/Glass/SandBottom
@onready var sand_drip = $Offset/Glass/SandDrip
@onready var animator = $AnimationPlayer

@onready var sand_frame_count = sand_top.hframes
var sand_idx = 0 : set = set_sand_idx
var max_ticks = 15
var tick_count = 0


func _ready() -> void:
	sand_drip.play("default")
	SyncManager.tick.connect(_on_tick)

func _on_tick():
	tick_count += 1
	var tick_progress = remap(tick_count, 0, max_ticks, 0, 1)
	var curved_progress = progress_curve.sample(tick_progress)
	sand_idx = lerp(0, sand_frame_count-1, curved_progress)
	animator.play("bump")
	if tick_count >= max_ticks:
		flip()
		tick_count = 0

func flip():
	sand_drip.play("stop")
	animator.play("flip")
	await animator.animation_finished
	sand_drip.play("default")
	glass.rotation = 0
	sand_idx = 0

func set_sand_idx(idx):
	sand_idx = idx
	sand_top.frame_coords.x = sand_idx
	sand_bottom.frame_coords.x = sand_idx
