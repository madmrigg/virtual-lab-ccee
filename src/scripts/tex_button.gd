extends TextureButton

export(NodePath) var target_panel = null
export(NodePath) var popup_panel = null
export(PackedScene) var target_scene = null
export var is_animated = false
export var is_centered = true
export var is_animated_on_hover = false
export var is_click_audio = true

onready var anim = $AnimationPlayer
onready var click = $AudioStreamPlayer2D

func _ready():
	if is_animated:
		play_anim()

func play_anim():
	if is_centered:
		set_pivot()
	anim.play("ScaleUpDown")
	
func stop_anim():
	anim.stop(true)
	anim.play("RESET")

func set_pivot():
	rect_pivot_offset = rect_size/2

func _on_button_up():
	if is_click_audio:
		click.play()
	if target_scene !=null and target_panel != null:
		var inst_scene = target_scene.instance()
		var inst_node = get_node(target_panel)
		for i in range(0, inst_node.get_child_count()):
			inst_node.get_child(i).queue_free()
		inst_node.add_child(inst_scene)
	elif target_scene != null and target_panel == null:
		if target_scene == null:
			pass
		else:
			var inst_scene = target_scene.instance()
			var inst_node = Global.view_panel
			if inst_scene != null and inst_node != null:
				for i in range(0, inst_node.get_child_count()):
					inst_node.get_child(i).queue_free()
					inst_node.add_child(inst_scene)
	if popup_panel != null:
		var hide_popup = get_node(popup_panel)
		hide_popup.visible = false

func _on_mouse_entered():
	if is_animated_on_hover:
		play_anim()
	else:
		rect_scale = rect_scale * 1.2

func _on_mouse_exited():
	if is_animated_on_hover:
		stop_anim()
	else:
		rect_scale = rect_scale * 1.2
