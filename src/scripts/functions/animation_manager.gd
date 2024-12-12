extends AnimationPlayer



func _on_Menu_button_up():
	play("LeftPaneSlideOut")


func _on_Menu_play_animation(l_menu_visible):
	if l_menu_visible:
		play("LeftPaneSlideOut")
		print("l menu out")
	else:
		play_backwards("LeftPaneSlideOut")
		print("l menu in")
