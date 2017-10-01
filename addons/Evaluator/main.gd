tool
extends EditorPlugin

# A class member to hold the dock during the plugin lifecycle
var dock
var toolBtn

func _enter_tree():
	# First load the dock scene and instance it:
	dock = preload("res://addons/Evaluator/calculator.tscn").instance()
	
	# Add the loaded scene to the docks:
	toolBtn = add_control_to_bottom_panel(dock, "Evaluator")
	# Note that LEFT_UL means the left of the editor, upper-left dock
	pass

func _exit_tree():
	# Remove the scene from the docks:
	remove_control_from_bottom_panel(dock)
	dock.free() # Erase the control from the memory
	pass
