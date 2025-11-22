extends State
class_name Idle

func enter(msg := {}):
	actor.anim.play("idle")
	actor.turn_manager.turn_active(true)

func handle_input(event: InputEvent) -> void:
	if actor.type == Enum.ActorType.Hero and event.is_action_pressed("charge"):
		state_manager.transition_to("Charge")
