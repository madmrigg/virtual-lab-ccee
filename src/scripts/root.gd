extends Control

var dark_mode = false
export var dark_theme = "res://src/resources/themes/windows_10_dark/theme.tres"
export var light_theme = "res://src/resources/themes/windows_10_light/theme.tres"


func _on_UITheme_pressed():
	if dark_mode == true:
		self.theme = light_theme
	if dark_mode == false:
		self.theme = dark_theme




func _on_MinMax_pressed():
	OS.set_window_minimized(true)
	pass # Replace with function body.


func _on_FullScreen_pressed():
	pass # Replace with function body.


func _on_Exit_pressed():
	get_tree().quit()
	pass # Replace with function body.
