tool
extends Panel

onready var formula = get_node("formula");
onready var console = get_node("console");

func _ready():
	console.set_text("");
	formula.set_text("");
	pass

func _on_formula_text_entered( text ):
	var c_text = console.get_text();
	var res = evaluate(text);
	var value = str(res);
	if typeof(res) != 0:
		console.set_text( str( c_text, text , " = ", value,  "\n") );
		formula.set_text("");
	else:
		console.set_text( str( c_text, "Formula Error! See console please\n") );
	pass # replace with function body

func evaluate(input):
	var script = GDScript.new()
	script.set_source_code("tool\nfunc eval():\n\treturn (" + input + ")")
	script.reload()

	var obj = Reference.new()
	obj.set_script(script)

	return obj.eval()


func _on_clear_button_up():
	console.set_text("");
	pass # replace with function body
