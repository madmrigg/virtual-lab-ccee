extends Button

onready var popup = $"../.."
onready var click = $AudioStreamPlayer2D

func _on_button_up():
	click.play()
	popup.visible = false
