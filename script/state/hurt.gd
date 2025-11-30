extends State
class_name Hurt

func enter(msg := {}):
	actor.turn_manager.turn_active(false)
	await get_tree().create_timer(0.1).timeout
	actor.anim.pause()
	actor.anim.self_modulate = Color(0.753, 0.0, 0.0, 1.0)
	actor.sound_hurt.play()
	await get_tree().create_timer(0.3).timeout
	actor.anim.play()
	state_manager.transition_to(state_manager.previous_state.name)
	
func exit():
	actor.anim.self_modulate = Color(1,1,1,1)
	actor.turn_manager.turn_active(true)
