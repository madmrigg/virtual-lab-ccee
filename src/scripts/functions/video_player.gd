extends VideoPlayer

onready var pp_btn = $Control/PlayPause
onready var audio_bus = AudioServer.get_bus_index("Master")
var loop = false
var video_stream

func _ready():
	Global.video_player = self

func _on_PlayPause_button_up():
	paused != paused
	if is_playing():
		stop()
		#self.paused = true
	else:
		play()
		#self.pause = false

func _on_Loop_button_up():
	loop = !loop


func _on_MuteUnmute_button_up():
	AudioServer.set_bus_mute(audio_bus, not AudioServer.is_bus_mute(audio_bus))


func _on_VideoPlayer_finished():
	play()


func _on_Hide_button_up():
	$AnimationPlayer.play("HideVideoPlayer")


func _on_FullScreen_button_up():
	OS.window_fullscreen = !OS.window_fullscreen
