extends Control

export(PackedScene) var scene = null

func _on_gui_input(event):
	if Input.is_action_pressed("mouse_left_click"):
		if scene != null:
			var scene_path = scene.get_path()
			SceneChanger.change_scene(scene_path)

func _on_Audio_button_up():
	var audio_bus = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_mute(audio_bus, not AudioServer.is_bus_mute(audio_bus))
	if !AudioServer.is_bus_mute(audio_bus):
		var button = $WelcomePanel/MarginContainer/WelcomeText/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_up_FILL0_wght400_GRAD200_opsz48.png")
	elif AudioServer.is_bus_mute(audio_bus):
		var button = $WelcomePanel/MarginContainer/WelcomeText/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_off_FILL0_wght400_GRAD200_opsz48.png")

func _on_Narrator_button_up():
	Global.auto_narration = !Global.auto_narration
	if Global.auto_narration:
		var button = $WelcomePanel/MarginContainer/WelcomeText/HBoxContainer/Narrator
		button.icon = load("res://src/ui_elements/icons/record_voice_over_FILL0_wght400_GRAD0_opsz48.png")
	elif !Global.auto_narration:
		var button = $WelcomePanel/MarginContainer/WelcomeText/HBoxContainer/Narrator
		button.icon = load("res://src/ui_elements/icons/voice_over_off_FILL0_wght400_GRAD0_opsz48.png")

func _on_Load_button_up():
	pass # Replace with function body.

func _on_Start_button_up():
	if scene != null:
		var scene_path = scene.get_path()
		SceneChanger.change_scene(scene_path)

func _on_Exit_button_up():
	get_tree().quit()
	
