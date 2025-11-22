extends Node
class_name BattleManager

@export var hero : Actor
@export var hero_turn_gauge : ProgressBar
@export var hero_health_bar : ProgressBar

@export var enemy : Actor
@export var enemy_turn_gauge : ProgressBar
@export var enemy_health_bar : ProgressBar

func _ready() -> void:
	BattleSignal.hero_attacked.connect(_on_hero_attacked)
	BattleSignal.enemy_attacked.connect(_on_enemy_attacked)

func _process(delta: float) -> void:
	_update_hero_ui()
	_update_enemy_ui()

func _update_hero_ui() -> void:
	hero_turn_gauge.value = hero.turn_manager.turn_gauge
	hero_health_bar.value = hero.health
	hero_health_bar.max_value = hero.max_health
	
func _on_hero_attacked(damage : int) -> void:
	hero.attacked(damage)
	
func _update_enemy_ui() -> void:
	enemy_turn_gauge.value = enemy.turn_manager.turn_gauge
	enemy_health_bar.value = enemy.health
	enemy_health_bar.max_value = enemy.max_health

func _on_enemy_attacked(damage : int) -> void:
	enemy.attacked(damage)
