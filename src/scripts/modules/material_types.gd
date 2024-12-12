extends OptionButton
class_name MaterialTypes


export(NodePath) var beam_list
signal change_beam_material


func _ready():
	add_items()


func add_items():
	add_item(("res://src/3d/textures/rusty_metal_sheet/rusty_metal_sheet.tres"))
	add_item("res://src/3d/textures/rusty_metal_o2/rusty_metal_02.tres")

func _on_SelectMaterials_item_selected(index):
	
	var material_path = get_item_text(index)
	emit_signal("change_beam_material", material_path)


