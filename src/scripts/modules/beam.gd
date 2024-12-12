extends VBoxContainer

onready var camera = $BeamView3D/Viewport/CameraAnchor/
onready var viewport = $BeamView3D/Viewport

func _ready():
	rect_pivot_offset = rect_size/2

func get_drag_data(position):
	print("data dragged")
	# Extract viewport texture
	var view: Viewport = viewport.get_viewport()
	var tex: Texture = view.get_texture()
	var img: Image = tex.get_data()
	img.flip_y()
	img.save_png("user://stuff.png")
	#Set viewport texture as drag_texture
	var drag_texture = TextureRect.new()
	drag_texture.expand = true
	drag_texture.texture = load("res://icon.png")
	drag_texture.rect_size = Vector2(192,192)
	#Set control to adjust position to center of mouse
	var control = Control.new()
	control.add_child(drag_texture)
	drag_texture.rect_position = drag_texture.rect_size / (-2)
	set_drag_preview(control)
	print("image: ", img)
	return

func can_drop_data(position, data):
	pass

func drop_data(position, data):
	print("data dropper")
	pass

