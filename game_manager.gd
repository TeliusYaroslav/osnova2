extends Node

#@onready var label = %Label
@onready var label = $"../CanvasLayer/Panel/Label"

var points = 0

func add_point():
	points  += 1
	print(points)
	label.text = str(points)
