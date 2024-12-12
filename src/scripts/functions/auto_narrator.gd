extends Label

onready var tts = TextToSpeechGlobal
#onready var tts = $TextToSpeech
var text_ts =  ""
var tts_speed = 1.0
export var tts_on_start = true

func _ready():
	text_ts = self.text
	if !tts_on_start:
		return
	if Global.auto_narration:
		yield(tts.say(text_ts, TextToSpeechEngine.VOICE_EEY, tts_speed), "completed")

func tts():
	if Global.auto_narration:
		yield(tts.say(text_ts, TextToSpeechEngine.VOICE_EEY, tts_speed), "completed")
