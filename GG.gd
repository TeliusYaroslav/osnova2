extends CharacterBody2D
class_name Hero

var enemy_inattak_range = false 
var enemy_attak_cooldown

var attack_ip = false
var current_dir = 'none'

var hp = 100
var SPEED = 450.0
var JUMP_VELOCITY = -650.0
const ladder = 20
@export var climbing = false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):

	if climbing == false:
		velocity.y += ladder
	elif climbing == true:
		velocity.y = 0
		if Input.is_action_pressed("ui_up"):
			velocity.y = -SPEED
		elif Input.is_action_pressed("ui_down"):
			velocity.y = SPEED    
	else:
		pass            
	
	
	
		
	if not is_on_floor():
		velocity.y += gravity * delta
	
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction == 1:
		$AnimatedSprite2D.flip_h = false

		
	elif direction == -1:
		$AnimatedSprite2D.flip_h = true

	
	if direction:
		velocity.x = direction * SPEED
		if is_on_floor():
			$AnimationPlayer.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if is_on_floor():
			if not $AnimationPlayer.current_animation == "attack":
				$AnimatedSprite2D.play("stay")
			
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimationPlayer.play("jump")
	attac()	
	

	move_and_slide()

func player():
	pass

func attac():
	var dir = current_dir
	if Input.is_action_just_pressed("attac"):
		#print('attaaaaak')
		$AnimationPlayer.stop()
		global.player_current_attack = true
		$AnimationPlayer.play("attack", -1 , 2)
		attack_ip = true
		print("aaaaaaaaa")
		
		
		
	#elif not Input.is_action_pressed("attac"):
		#$AnimatedSprite2D.stop()
		
func player_sell_method():
	pass
func player_shop_method():
	pass
		
