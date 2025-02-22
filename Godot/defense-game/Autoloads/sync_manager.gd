extends Node

signal tick

@onready var timer = $Timer

@export var interval_length = 1.0 # seconds


func _ready() -> void:
	timer.wait_time = interval_length
	timer.start()
	timer.timeout.connect(tick.emit)
