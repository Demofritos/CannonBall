extends Control


func _on_play_game_button_down() -> void:
	get_tree().change_scene_to_file("res://world.tscn")
