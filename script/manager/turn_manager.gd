extends Node
class_name TurnManager

signal turn_ready

@export var speed : int = 20

var turn_gauge : float = 0
var max_turn_gauge : float = 100
var turn_gauge_active : bool = true

func _process(delta: float) -> void:
	if turn_gauge_active:
		if turn_gauge >= max_turn_gauge:
			emit_signal("turn_ready")
			turn_gauge = 0
		else:
			turn_gauge += delta * speed

func turn_active(value : bool) -> void:
	turn_gauge_active = value
