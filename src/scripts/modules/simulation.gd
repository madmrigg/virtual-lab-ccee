extends Tabs

onready var page_count: int = 0
onready var page_current: int = 0
var selected_beam
var selected_connection


func _on_BeamSelection_selected_beam(beam):
	selected_beam = beam
	print(beam, " ",selected_beam)
	$VBoxContainer/Pages/Input/AspectRatioContainer/VBoxContainer/Beam.text = str(selected_beam.name)


func _on_ConnectionSelection_selected_connection(connection):
	selected_connection = connection
	print(connection, " ", selected_connection)
	$VBoxContainer/Pages/Input/AspectRatioContainer/VBoxContainer/Connection.text = str(selected_connection.name)
