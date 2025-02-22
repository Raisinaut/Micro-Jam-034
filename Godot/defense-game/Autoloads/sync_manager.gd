extends Node

@onready var timer = $Timer

@export var interval_length = 0.2 # seconds


func _ready() -> void:
	timer.wait_time = interval_length
	timer.start()

func beat():
	beat.emit()
	await get_tree().create_timer(interval_length).timeout
