extends Panel

signal selected_column
var column
export(NodePath) var c_beam = null
export(NodePath) var h_beam = null
export(NodePath) var i_beam = null
export(NodePath) var o_beam = null

func _on_C_Beam_mouse_entered():
	var column = get_node(c_beam)
	column.camera.play_anim(true)
	$AnimationPlayer.play("C_Beam")


func _on_C_Beam_mouse_exited():
	var column = get_node(c_beam)
	column.camera.play_anim(false)
	$AnimationPlayer.play("RESET")


func _on_H_Beam_mouse_entered():
	var column = get_node(h_beam)
	column.camera.play_anim(true)
	$AnimationPlayer.play("H_Beam")


func _on_H_Beam_mouse_exited():
	var column = get_node(h_beam)
	column.camera.play_anim(false)
	$AnimationPlayer.play("RESET")


func _on_I_Beam_mouse_entered():
	var column = get_node(i_beam)
	column.camera.play_anim(true)
	$AnimationPlayer.play("I_Beam")


func _on_I_Beam_mouse_exited():
	var column = get_node(i_beam)
	column.camera.play_anim(false)
	$AnimationPlayer.play("RESET")


func _on_O_Beam_mouse_entered():
	var column = get_node(o_beam)
	column.camera.play_anim(true)
	$AnimationPlayer.play("O_Beam")


func _on_O_Beam_mouse_exited():
	var column = get_node(o_beam)
	column.camera.play_anim(false)
	$AnimationPlayer.play("RESET")





func _on_C_Beam_gui_input(event):
	if Input.is_action_just_released("mouse_left_click"):
		column = get_node(c_beam)
		emit_signal("selected_beam", column)
		print(c_beam)


func _on_H_Beam_gui_input(event):
	if Input.is_action_just_released("mouse_left_click"):
		column = get_node(h_beam)
		emit_signal("selected_beam", column)
		print(h_beam)


func _on_I_Beam_gui_input(event):
	if Input.is_action_just_released("mouse_left_click"):
		column = get_node(i_beam)
		emit_signal("selected_beam", column)
		print(i_beam)


func _on_O_Beam_gui_input(event):
	if Input.is_action_just_released("mouse_left_click"):
		column = get_node(o_beam)
		emit_signal("selected_beam", column)
		print(o_beam)
