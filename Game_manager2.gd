extends Node

@onready var points_gold_coins = %points_gold_coins

var points = 0

func add_points():
	points += 1
	print(points)
	points_gold_coins.text = str(points)

	
