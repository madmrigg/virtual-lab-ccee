extends OptionButton
class_name BeamTypes


export(NodePath) var beam_path = null
var beam


func _ready():
	add_items()


func add_items():
	if beam_path != null:
		var inst_node = get_node(beam_path)
		var ch = inst_node.get_children()
		for i in ch:
			add_item(i.get_path())
		beam = inst_node.get_child(0)
		#print(beam)


func _on_SelectBeams_item_selected(index):
	var inst_node = get_node(beam_path)
	#var ch = inst_node.get_children()
	for i in inst_node.get_child_count():
		if i == index:
			inst_node.get_child(i).visible = true
			inst_node.get_child(i).visible = true
			beam = inst_node.get_child(i)
		else:
			inst_node.get_child(i).visible = false



func _on_SelectMaterials_change_beam_material(material_path):
	var inst_node = get_node(beam_path)
	for i in inst_node.get_child_count():
		if beam != null:
			beam = inst_node.get_child(i)
			beam.material_override = ResourceLoader.load(material_path)


