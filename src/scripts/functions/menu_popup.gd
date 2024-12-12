extends Button

onready var popup = $AnimatedPopUp
onready var click = $AnimatedPopUp/AudioStreamPlayer2D
onready var popped_up: bool = false
export(NodePath) var popup_panel = null
export(String, "no_anim", "default", "center") var popup_anim = "no_anim"
export var is_click_audio = true
export var is_animate_on_hover = true

func _on_button_up():
	if !popped_up:
		popup.play_anim(popup_anim)
		if is_click_audio:
			click.play()
		popped_up = true
	elif popped_up:
		popup.play_anim("hide")
		popped_up = false
	if popup_panel != null:
		var hide_popup = get_node(popup_panel)
		hide_popup.hide()

func _on_mouse_entered():
	pass
#	if is_animate_on_hover:
#		popup.play_anim("hover")

func _on_mouse_exited():
	pass
#	if is_animate_on_hover:
#		popup.stop_anim()

func _on_popup_hide():
	popped_up = false
	pass # Replace with function body.
