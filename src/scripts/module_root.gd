extends TabContainer

func _on_ModuleRoot_tab_changed(tab):
	print(tab)
	match tab:
		0:$AnimationPlayer.play("Tab0StartAnim")
		#1: $AnimationPlayer.play("Tab1StartAnim")
