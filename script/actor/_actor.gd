extends Node
class_name Actor

@export var type : Enum.ActorType = Enum.ActorType.Hero

@export var health : int = 30
@export var max_health : int = 30
@export var mana : int = 30
@export var max_mana : int = 30

@onready var anim : AnimatedSprite2D = $AnimatedSprite2D
@onready var state_manager : StateManager = $StateManager
@onready var turn_manager : TurnManager = $TurnManager

func _ready() -> void:
	anim.animation_finished.connect(_on_anim_finished)
	turn_manager.turn_ready.connect(_on_turn_ready)

func _on_anim_finished() -> void:
	state_manager.current_state.animation_finished()

func _on_turn_ready() -> void:
	state_manager.transition_to("Attack")
