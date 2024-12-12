extends Button

export var tab_container: NodePath
export var next_tab: NodePath

func _on_button_up():
	if tab_container != null:
		var inst = get_node(tab_container)
		var current_tab = inst.get_current_tab()
		var total_tabs = inst.get_tab_count()
		print("Current Tab: ", current_tab, " | Total Tabs: ", total_tabs)
		if next_tab != null:
			var nxt = get_node(next_tab)
			var idx = nxt.get_index()
			inst.set_current_tab(current_tab + 1) #idx
