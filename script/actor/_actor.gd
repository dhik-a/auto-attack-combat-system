extends Node
class_name Actor

@export var type : Enum.ActorType = Enum.ActorType.Hero

@export var health : int = 30
@export var max_health : int = 30
@export var mana : int = 30
@export var max_mana : int = 30
@export var attack : int = 10
@export var defense : int = 10

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_manager : StateManager = $StateManager
@onready var turn_manager : TurnManager = $TurnManager
@onready var modifier_manager : ModifierManager = $ModifierManager

func _ready() -> void:
	anim.animation_finished.connect(_on_anim_finished)
	turn_manager.turn_ready.connect(_on_turn_ready)

func _on_anim_finished() -> void:
	state_manager.current_state.animation_finished()

func _on_turn_ready() -> void:
	state_manager.transition_to("Attack")

func attacked(power : int) -> void:
	var damage = BattleCalculation.calculate_damage(power, defense, modifier_manager.modifiers)
	show_damage(damage)
	if (health - damage) <= 0:
		health = 0
		state_manager.transition_to("Dead")
	else:
		health -= damage
		state_manager.transition_to("Hurt")
		
func show_damage(damage : int) -> void:
	var damage_number = preload("res://scene/prefab/damage_number.tscn").instantiate()
	damage_number.set_number(damage)
	var x_direction = -20
	if type == Enum.ActorType.Enemy:
		x_direction = 10
	damage_number.set_x_direction(x_direction)
	damage_number.global_position = self.global_position
	get_tree().current_scene.add_child(damage_number)

func charging() -> void:
	pass
