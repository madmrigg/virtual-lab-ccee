extends PopupPanel

onready var anim_node = $AnimationPlayer
onready var rect_pivot_original = rect_pivot_offset

func play_anim(pivot:String):
	rect_pivot_offset = rect_pivot_original
	match pivot:
		"no_anim":
			popup()
		"default":
			rect_pivot_offset = Vector2.ZERO
			anim_node.play("PopUpScale")
		"center":
			rect_pivot_offset = rect_pivot_offset - rect_size/2
			anim_node.play("PopUpScaleCentered")
		"hide":
			anim_node.play("PopUpHide")
		"hide_centered":
			rect_pivot_offset = rect_pivot_offset - rect_size/2
			anim_node.play("PopUpHide")
		"hover":
			rect_pivot_offset = rect_pivot_offset - rect_size/2
			anim_node.play("HoverAnimation")

func stop_anim():
	anim_node.stop(true)
	anim_node.play("RESET")

func _on_popup_hide():
	rect_pivot_offset = rect_pivot_original
