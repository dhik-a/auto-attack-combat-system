extends State
class_name Attack

func enter(msg := {}):
	actor.anim.play("attack")
	actor.turn_manager.turn_active(false)
	
func animation_finished() -> void:
	state_manager.transition_to("Idle")
