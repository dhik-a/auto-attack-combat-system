extends State
class_name Attack

func enter(msg := {}):
	actor.anim.play("attack")
	actor.turn_manager.turn_active(false)
	if actor.type == Enum.ActorType.Hero:
		BattleSignal.emit_signal("enemy_attacked", actor.attack)
	else:
		BattleSignal.emit_signal("hero_attacked", actor.attack)
	
func animation_finished() -> void:
	state_manager.transition_to("Idle")
