extends TextureProgressBar

@onready var gg = $"../../../GG"

var startpos = Vector2(200,100)

func _ready():
	pass
func respawn():
	gg.position = startpos
	gg.hp = 100


func _process(delta):
	value = gg.hp
	if gg.hp <= 0:
		respawn()



