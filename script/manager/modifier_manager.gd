extends Node
class_name ModifierManager

var modifiers: Array[Modifier] = []

func add_modifier(modifier : Modifier) -> void:
	modifiers.append(modifier)

func remove_modifier(modifier : Modifier) -> void:
	modifiers.erase(modifier)
