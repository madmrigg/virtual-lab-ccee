extends PanelContainer


var full_screen = false
export(NodePath) var root_node_path = null
var following = false
var dragging_start_position = Vector2()
var drag_position = Vector2.ZERO


func _process(_delta):
	if following:
		OS.set_window_position(OS.window_position + get_global_mouse_position() - dragging_start_position)


func _on_TitleBar_gui_input(event):
	if event is InputEventMouseButton:
		print("title bar input!")
		if event.get_button_index() == 1: #&& event.pressed:
			following = !following
			dragging_start_position = get_local_mouse_position()


func _on_MinMax_button_up():
	OS.set_window_minimized(true)


func _on_FullScreen_button_up():
	OS.window_fullscreen = !OS.window_fullscreen


func _on_Exit_button_up():
	get_tree().quit()


