extends Control

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_elegir_nivel_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/juego.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
