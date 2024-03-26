extends StaticBody2D
@onready var game_manager_1 = get_parent().get_parent().get_node("Game_Manager1")
@onready var gg = get_parent().get_parent().get_node("GG")
@onready var points_simple_label = get_parent().get_parent().get_node("UI_SIMPLE_COINS").get_node("Panel").get_node("points_simple_label")
@onready var game_manager_2 = get_parent().get_parent().get_node("Game_manager2")
@onready var points_gold_coins = get_parent().get_parent().get_node("UI_GOLD_COINS").get_node("Panel").get_node("points_gold_coins")
@onready var gold_key_manager = get_parent().get_parent().get_node("Gold_Key_Manager")
@onready var label_key =  get_parent().get_parent().get_node("GOLD_KEY").get_node("Panel").get_node("Label_key")




var item = 1




var item1price = 10
var item2price = 10
var item3price = 10
var item4price = 10


var item1owned = false
var item2owned = false
var item3owned = false
var item4owned = false
func _ready():
	$icon.play("heart")
	item = 1
	
var price 
func _physics_process(delta):
	#print(get_parent().get_parent().get_node("GG"))
	if self.visible == true:
		if item == 1:
			$icon.play("heart")
		if item == 2:
			$icon.play("jump")
		if item == 3:
			$icon.play("speed")	
		if item == 4:
			$icon.play("key")
			$coincon.play("gold_coin")
	



func _on_buttonleft_pressed():
	swap_item_back()
func _on_buttonright_pressed():
	swap_item_forward()
func _on_buybutton_pressed():
	if item == 1:
		
		price =  item1price
		print(2)
		print(game_manager_1.points)
		if game_manager_1.points >= price:
			if item1owned == false:
				print(2)
				buy(price)
	elif item == 2:
		price = item2price
		if game_manager_1.points >= price:
			if item2owned == false:
				buy(price)
	elif item == 3:
		price = item3price
		if game_manager_1.points >= price:
			if item3owned == false:
				buy(price)
	elif item == 4:
		price = item4price
		if game_manager_2.points >= price:
			if item4owned == false:
				buy_key(price)
			


func swap_item_back():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 4
	elif item == 4:
		item = 1
func swap_item_forward():
	if item == 1:
		item = 2
	elif item == 2:
		item = 3
	elif item == 3:
		item = 4
	elif item == 4:
		item = 1

func buy(price):
	game_manager_1.points -= price
	
	points_simple_label.text = str(game_manager_1.points)
	
	
	if item == 1:
		#item1owned = true
		gg.hp += 10
	if item == 2:
		gg.JUMP_VELOCITY -= 100
		
	if item == 3:
		#
		gg.SPEED += 50
	
	
#func buy_key(price):
	#game_manager_2.points -= price
	#points_gold_coins = str(game_manager_2.points)
	#if item == 4:
		#pass
	
func buy_key(price):
	game_manager_2.points -= price
	points_gold_coins.text = str(game_manager_2.points)
	gold_key_manager.points += 1
	label_key.text = str(gold_key_manager.points)
	
	
	if item == 4:
		pass
	

	
	
	
