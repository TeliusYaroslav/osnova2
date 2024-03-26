extends Area2D

@onready var counter_comp = $"../Counter_comp"

var player_entered = false



func _on_body_entered(body):
	if (body.name == "Main_gg" and not player_entered):
		counter_comp.add_points()
		player_entered = true
