extends PanelContainer

signal selected_connection
var connection


func _on_Welded_C_mouse_entered():
	$CenterContainer/VBoxContainer/Welded_C.camera.play_anim(true)
	$AnimationPlayer.play("Welded_C")


func _on_Welded_C_mouse_exited():
	$CenterContainer/VBoxContainer/Welded_C.camera.play_anim(false)
	$AnimationPlayer.play("RESET")


func _on_Welded_C_gui_input(event):
	if Input.is_action_just_released("mouse_left_click"):
		connection = $CenterContainer/VBoxContainer/Welded_C
		emit_signal("selected_connection", connection)
		$CenterContainer/VBoxContainer/Connection.text = "Welded Connection"
