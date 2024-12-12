extends Tabs

onready var page_count: int = 0
onready var page_current: int = 0
export(NodePath) var nav_pages = null
export(NodePath) var page_count_label = null

func _ready():
	page_count = 0
	page_current = 0
	if nav_pages != null:
		var inst_node = get_node(nav_pages)
		page_count = inst_node.get_child_count()
		if page_count > 0:
			for i in page_count:
				if i == 0:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = true
				else:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = false
			inst_node = get_node(page_count_label)
			var label_text = str(page_current + 1) + "/" + str(page_count)
			inst_node.set_text(label_text)


func _on_Back_button_up():
	pass # Replace with function body.


func _on_Forward_button_up():
	
	page_current = page_current + 1
		
	page_current = clamp(page_current, 0, page_count - 1)
	
	print("p_current: ", page_current)
	
	if nav_pages != null:
		var inst_node = get_node(nav_pages)
		page_count = inst_node.get_child_count()
		if page_count != null or page_count != 0:
			for i in page_count:
				if i == page_current:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = true
				else:
					var inst_child = inst_node.get_child(i)
					inst_child.visible = false
			inst_node = get_node(page_count_label)
			var label_text = str(page_current + 1) + "/" + str(page_count)
			inst_node.set_text(label_text)
