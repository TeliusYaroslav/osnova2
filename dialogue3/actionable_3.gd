extends Area2D

@export var dialoque_resource: DialogueResource
@export var dialoque_start: String = "start"

func action():
	DialogueManager.show_example_dialogue_balloon(dialoque_resource,dialoque_start)
