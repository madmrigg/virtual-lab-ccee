extends PanelContainer

var dark_mode = false
export(Resource) var dark_theme = load("res://src/themes/windows_10_dark/theme.tres")
export(Resource) var light_theme = load("res://src/themes/windows_10_light/theme.tres")
export(NodePath) var root_node_path = null
onready var audio_bus = AudioServer.get_bus_index("Master")

func _on_UITheme_button_up():
	#$HBoxContainer/Buttons/UITheme/PopUp.popup_centered()
	if root_node_path != null:
		var inst_node = get_node(root_node_path)
		print(inst_node)
		var t = inst_node.get_theme()
		print(t)
		if dark_mode == false:
			inst_node.set_theme(dark_theme)
			print(t, "dark theme")
			dark_mode = true
		else:
			inst_node.set_theme(light_theme)
			print(t, "light theme")
			dark_mode = false

func _on_Settings_button_up():
	$HBoxContainer/Settings/PopUp.popup_centered()

func _on_Home_button_up():
	SceneChanger.change_scene("res://src/scenes/Home.tscn")

func _on_Narration_button_up():
	Global.auto_narration = !Global.auto_narration
	print(Global.auto_narration)
	if Global.auto_narration:
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/Narration
		button.icon = load("res://src/ui_elements/icons/record_voice_over_FILL0_wght400_GRAD0_opsz48.png")
	elif !Global.auto_narration:
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/Narration
		button.icon = load("res://src/ui_elements/icons/voice_over_off_FILL0_wght400_GRAD0_opsz48.png")

func _on_Audio_button_up():
	AudioServer.set_bus_mute(audio_bus, not AudioServer.is_bus_mute(audio_bus))
	if !AudioServer.is_bus_mute(audio_bus):
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_up_FILL0_wght400_GRAD200_opsz48.png")
	elif AudioServer.is_bus_mute(audio_bus):
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_off_FILL0_wght400_GRAD200_opsz48.png")

func _on_AppVolume_value_changed(value):
	AudioServer.set_bus_volume_db(audio_bus, value)
	if value == -40:
		AudioServer.set_bus_mute(audio_bus, true)
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_off_FILL0_wght400_GRAD200_opsz48.png")
	else:
		AudioServer.set_bus_mute(audio_bus, false)
		var button = $HBoxContainer/Settings/PopUp/VBoxContainer/HBoxContainer/Audio
		button.icon = load("res://src/ui_elements/icons/volume_up_FILL0_wght400_GRAD200_opsz48.png")
