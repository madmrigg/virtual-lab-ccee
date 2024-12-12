extends Button


var link

func _ready():
	if self.get_text() != null:
		link = self.get_text()

func _on_WebLinkOpener_button_up():
	GlobalVideoPlayer.play_video(link)
#	if link != null:
#		OS.shell_open(link)
