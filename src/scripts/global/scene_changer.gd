extends CanvasLayer

func _ready():
	get_tree().get_root().set_transparent_background(true)

func change_scene(target_scene: String) -> void:
	$AnimationPlayer.play("Dissolve")
	yield($AnimationPlayer, "animation_finished")
	get_tree().change_scene(target_scene)
	$AnimationPlayer.play_backwards("Dissolve")
