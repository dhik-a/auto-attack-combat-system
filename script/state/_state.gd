extends Node
class_name State

var actor: Actor
var state_manager: StateManager

func enter(msg := {}):
	pass

func exit():
	pass

func handle_input(event: InputEvent) -> void:
	pass

func update(delta: float) -> void:
	pass

func physics_update(delta: float) -> void:
	pass

func animation_finished() -> void:
	pass
