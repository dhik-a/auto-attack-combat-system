extends Node
class_name StateManager

var current_state: State
var previous_state: State

func _ready():
	await get_parent().ready
	# assign references to all state children
	for child in get_children():
		if child is State:
			child.actor = get_parent()      # was child.owner
			child.state_manager = self

	# initial state
	current_state = get_node("Idle")
	previous_state = current_state
	current_state.enter()

func transition_to(state_name: String, msg := {}):
	if not has_node(state_name):
		push_error("State not found: %s" % state_name)
		return

	current_state.exit()
	previous_state = current_state
	current_state = get_node(state_name)
	current_state.enter(msg)

func _input(event):
	current_state.handle_input(event)

func _process(delta):
	current_state.update(delta)

func _physics_process(delta):
	current_state.physics_update(delta)
