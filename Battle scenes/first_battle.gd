extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _change_scene_to_second() -> void:
	get_tree().change_scene_to_file("res://second_scene.tscn") # Replace with function body.
