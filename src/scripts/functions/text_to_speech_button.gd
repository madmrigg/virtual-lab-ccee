extends Button

export var tts_node: NodePath
export var tts_speed = 1.0
onready var tts = TextToSpeechGlobal
#onready var tts = $TextToSpeech

func _on_button_up():
	if tts_node != null:
		var t_node = get_node(tts_node)
		var text_ts
		if t_node is Label:
			text_ts = t_node.get_text()
		elif t_node is RichTextLabel:
			text_ts = t_node.get_bbcode()
		else:
			print("Cannot extract text from node!")
		print(text_ts, ": ", t_node, ": ", tts_node)
		#yield(tts.say(text_ts, TextToSpeechEngine.VOICE_EEY, tts_speed), "completed")
		yield(tts.say(text_ts, TextToSpeechEngine.VOICE_EEY, tts_speed), "completed")
		
