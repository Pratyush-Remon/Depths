@icon("res://Scenes/DynamicObjects/Water/washer-svgrepo-com.svg")
extends Node
class_name FSM

#Variables for FSM
var count = 0
var states:Dictionary = {}
var current_state:State
@export var initial_state:State

func _ready():
	for child in get_children():
		if child is State:
			states[child.name.to_lower()]=child
			child.state_transition.connect(change_state)
	if initial_state:
		initial_state.enter_state()
		current_state = initial_state

func _process(delta):
	print(current_state)
	if current_state:
		current_state.update_state(delta)

func change_state(source_state : State, new_state_name : String):
	if source_state != current_state:
		#print("Invalid change_state trying from: " + source_state.name + " but currently in: " + current_state.name)
		#This typically only happens when trying to switch from death state following a force_change
		return
	
	var new_state = states.get(new_state_name.to_lower())
	if !new_state:
		print("New state is empty")
		return
		
	if current_state:
		current_state.exit_state()
		
	new_state.enter_state()
	
	current_state = new_state
