extends Button

export(PackedScene) var target_scene = null
export(NodePath) var target_panel = null
export(NodePath) var anim_player = null

var is_module = true

func _ready():
	var p_name = self.name
	self.set_text(p_name)

func _physics_process(delta):
	pass
	#Make related node visible
#	if get_focus_owner() != self:
#		if node_to_show != null:
#			var inst_node = get_node(node_to_show)
#			inst_node.visible = false
#	elif get_focus_owner() == self:
#		if node_to_show != null:
#			var inst_node = get_node(node_to_show)
#			inst_node.visible = true
#	#Make related node  !visible
#	if get_focus_owner() != self:
#		if node_to_hide != null:
#			var inst_node = get_node(node_to_hide)
#			inst_node.visible = true
#	elif get_focus_owner() == self:
#		if node_to_hide != null:
#			var inst_node = get_node(node_to_hide)
#			inst_node.visible = true


func _on_ModuleButton_button_up():
	#Global.is_module = true
	#get_node(anim_player).play("ModulesSlideIn")
	if target_scene !=null and target_panel != null:
		var inst_scene = target_scene.instance()
		var inst_node = get_node(target_panel)
		for i in range(0, inst_node.get_child_count()):
			inst_node.get_child(i).queue_free()
		inst_node.add_child(inst_scene)
