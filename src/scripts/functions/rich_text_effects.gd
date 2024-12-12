extends RichTextLabel

export(Array, PackedScene) var meta_link_res

func _ready():
	pass

func start_tween():
	var tween = Tween.new()
	self.add_child(tween)
	tween.interpolate_property(
		self, "percent_visible", 0.0, 1.0, 3.0, Tween.TRANS_CUBIC, Tween.EASE_OUT
	)
	tween.start()
	print("tween started")


func _on_meta_clicked(meta):
	print(meta, " : clicked")
	if meta != null:
		print(meta, " : clicked")
	match meta:
		"0":
			load_scene(meta_link_res[0])
		"1":
			load_scene(meta_link_res[1])
		"2":
			load_scene(meta_link_res[2])
		"3":
			load_scene(meta_link_res[3])
		"4":
			load_scene(meta_link_res[4])
		"5":
			load_scene(meta_link_res[5])
		"6":
			load_scene(meta_link_res[6])
		"7":
			load_scene(meta_link_res[7])
		"8":
			load_scene(meta_link_res[8])
		"9":
			load_scene(meta_link_res[9])
		"10":
			load_scene(meta_link_res[10])
		"11":
			load_scene(meta_link_res[11])
		"12":
			load_scene(meta_link_res[12])
		"12":
			load_scene(meta_link_res[13])
		"14":
			load_scene(meta_link_res[14])
		"15":
			load_scene(meta_link_res[15])
		"Test":
			print("Tested")


func load_scene(_scn):
#	for i in range(0, self.get_child_count()):
#		self.get_child(i).queue_free()
	print(_scn)
#	var inst_scn = load(_scn)
#	var scn = inst_scn.instance()
	var scn = _scn.instance()
	add_child(scn)
	if scn is PopupPanel:
		#scn.play_anim("center")
		scn.popup_centered()

