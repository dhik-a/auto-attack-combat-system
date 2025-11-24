extends State
class_name Charge

@export var amount: int = 1       # how much mana per tick
@export var interval: float = 0.5 # how often (in seconds)

@export var modifier_type : Enum.ModifierType = Enum.ModifierType.DamageReduction
@export var modifier_value : int = 0
@export var modifier_Value_type : Enum.ValueType = Enum.ValueType.Percentage

var modifier : Modifier
var timer : Timer = null 

func enter(msg := {}):
	actor.anim.play("charge")
	actor.turn_manager.turn_active(false)
	actor.charging()
	timer = Timer.new()
	timer.wait_time = interval
	timer.one_shot = false
	timer.autostart = true
	add_child(timer)

	#timer.timeout.connect(_on_charge_tick)
	
	if modifier_value > 0:
		_set_modifier()
		actor.modifier_manager.add_modifier(modifier)
	
func handle_input(event: InputEvent) -> void:
	if !event.is_action_pressed("charge"):
		state_manager.transition_to("Idle")

func exit():
	if timer != null:
		timer.queue_free()
		
	var modifiers = actor.modifier_manager.modifiers
	if modifiers.find(modifier) != null:
		actor.modifier_manager.remove_child(modifier)
		
func _on_charge_tick() -> void:
	if actor.mana < actor.max_mana:
		actor.mana = min(actor.mana + amount, actor.max_mana)
		
func _set_modifier() -> void:
	modifier = Modifier.new()
	modifier.type = modifier_type
	modifier.value = modifier_value
	modifier.value_type = modifier_Value_type
