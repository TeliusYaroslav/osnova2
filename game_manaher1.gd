extends Node

@onready var points_simple_label = %points_simple_label

var points = 0

func add_points():
	points += 1 
	print(points)
	points_simple_label.text = str(points)
	
