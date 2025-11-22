extends State
class_name Charge
 
func enter(msg := {}):
	actor.anim.play("charge")
	actor.turn_manager.turn_active(false)
	
func handle_input(event: InputEvent) -> void:
	if event.is_released():
		state_manager.transition_to("Idle")
