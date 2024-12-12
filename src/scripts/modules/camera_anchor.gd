extends Spatial

onready var anim = $Camera/AnimationPlayer

func play_anim(is_active: bool):
	if is_active:
		anim.play("RotateCamera")
	else:
		anim.stop()
