extends Node


@onready var label_key = %Label_key


var points = 0

func add_points():
	points += 1 
	print(points)
	label_key.text = str(points)
