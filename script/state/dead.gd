extends State
class_name Dead

var opacity = 1.0

func enter(msg := {}):
	actor.turn_manager.turn_active(false)
	await get_tree().create_timer(0.1).timeout
	actor.anim.pause()
	actor.anim.self_modulate = Color(0.753, 0.0, 0.0, opacity)

func update(delta: float) -> void:
	opacity -= delta
	actor.anim.self_modulate = Color(0.753, 0.0, 0.0, opacity)
