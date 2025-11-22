extends Node
class_name BattleManager

@export var hero : Actor
@export var hero_turn_gauge : ProgressBar

@export var enemy : Actor
@export var enemy_turn_gauge : ProgressBar

func _process(delta: float) -> void:
	hero_turn_gauge.value = hero.turn_manager.turn_gauge
	enemy_turn_gauge.value = enemy.turn_manager.turn_gauge
	
