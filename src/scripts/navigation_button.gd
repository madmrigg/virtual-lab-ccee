extends Button


export var forward: bool = true
var back: bool
export(NodePath) var nav_pages = null
export(NodePath) var page_count_label = null
export(NodePath) var parent_path = null
var parent


func _ready():
	return
	
	if parent_path != null:
		parent = get_node(parent_path)
		#print(parent.page_current) #= 0
		parent.page_current = 0
	
	if nav_pages != null:
		var inst_node = get_node(nav_pages)
		parent.page_count = inst_node.get_child_count()
		if parent.page_count != null or parent.page_count > 0:
			for i in parent.page_count:
				if i == 0:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = true
				else:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = false
			inst_node = get_node(page_count_label)
			var label_text = str(parent.page_current + 1) + "/" + str(parent.page_count)
			inst_node.set_text(label_text)


func _on_NavPages_button_up():
	return
	
	if forward:
		parent.page_current = parent.page_current + 1
	else:
		parent.page_current = parent.page_current - 1
		
	parent.page_current = clamp(parent.page_current, 0, parent.page_count - 1)
	
	print("p_current: ", parent.page_current)
	
	if nav_pages != null:
		var inst_node = get_node(nav_pages)
		parent.page_count = inst_node.get_child_count()
		if parent.page_count != null or parent.page_count != 0:
			for i in parent.page_count:
				if i == parent.page_current:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = true
				else:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = false
			inst_node = get_node(page_count_label)
			var label_text = str(parent.page_current + 1) + "/" + str(parent.page_count)
			inst_node.set_text(label_text)
