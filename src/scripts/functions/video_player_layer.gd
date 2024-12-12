extends CanvasLayer

func play_video(_link: String):
	init_yt_dlp(_link)
	#$VideoPlayer/AnimationPlayer.play("ShowVideoPlayer")

func init_yt_dlp(_link: String):
	var yt_dlp = YtDlp.new()
	yt_dlp.connect("ready", self, "some_function")
	yt_dlp.connect("download_completed", self, "some_other_function")

#	yt_dlp.download(
#		url: String,
#		destination: String,
#		file_name: String,
#		video_format: int = Video.WEBM,
#		audio_format: int = Audio.VORBIS
#	)
	
	yt_dlp.download("https://youtu.be/dQw4w9WgXcQ", OS.get_user_data_dir(), "video_clip")
	yield(yt_dlp, "ready")
	var stream := VideoStreamWebm.new()
	stream.set_file("user://video_clip.webm")
	$VideoPlayer.stream = stream
	$VideoPlayer/AnimationPlayer.play("ShowVideoPlayer")
	#$VideoPlayer.play
