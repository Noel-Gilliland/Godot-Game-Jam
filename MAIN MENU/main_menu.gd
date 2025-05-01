extends Control


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://character_select.tscn") # Replace with function body.


func _on_settings_pressed() -> void:
	get_tree().change_scene_to_file("res://setting.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit() # Replace with function body.
