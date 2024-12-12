extends VBoxContainer

onready var camera = $BeamView3D/Viewport/CameraAnchor

func _ready():
	rect_pivot_offset = rect_size/2
