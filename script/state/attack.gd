extends State
class_name Attack

@export var hit_frame : int

var has_attacked : bool = false

func enter(msg := {}):
	has_attacked = false
	actor.anim.play("attack")
	actor.turn_manager.turn_active(false)

func update(delta: float) -> void:
	var anim = actor.anim
	if anim.frame >= hit_frame and !has_attacked:
		has_attacked = true
		if actor.type == Enum.ActorType.Hero:
			BattleSignal.emit_signal("enemy_attacked", actor.attack)
		else:
			BattleSignal.emit_signal("hero_attacked", actor.attack)
	
func animation_finished() -> void:
	state_manager.transition_to("Idle")
