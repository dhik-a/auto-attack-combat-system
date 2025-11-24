extends Node2D

@export var duration: float = 1.6

var velocity := Vector2(0, -240) # initial upward pop
var gravity := 640              # falling force
var time_passed := 0.0

func _process(delta):
	time_passed += delta

	# Pop up → then fall
	global_position += velocity * delta
	velocity.y += gravity * delta  # gravity pulls down

	# Fade out
	var t = time_passed / duration
	$Label.modulate.a = lerp(1.0, 0.0, t)

	# Remove when done
	if time_passed > duration:
		queue_free()

func set_number(value: int):
	$Label.text = str(value)
	
func set_x_direction(value : int) -> void:
	velocity.x = randf_range(value - 10, value)
