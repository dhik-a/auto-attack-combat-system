extends State
class_name Charge

@export var modifier_type : Enum.ModifierType = Enum.ModifierType.DamageReduction
@export var modifier_value : int = 0
@export var modifier_Value_type : Enum.ValueType = Enum.ValueType.Percentage

var modifier : Modifier
 
func enter(msg := {}):
	actor.anim.play("charge")
	actor.turn_manager.turn_active(false)
	actor.charging()
	
	if modifier_value > 0:
		_set_modifier()
		actor.modifier_manager.add_modifier(modifier)
	
func handle_input(event: InputEvent) -> void:
	if event.is_released():
		state_manager.transition_to("Idle")

func exit():
	var modifiers = actor.modifier_manager.modifiers
	if modifiers.find(modifier) != null:
		actor.modifier_manager.remove_child(modifier)
		
func _set_modifier() -> void:
	modifier = Modifier.new()
	modifier.type = modifier_type
	modifier.value = modifier_value
	modifier.value_type = modifier_Value_type
