extends Node2D

@onready var pelota = $CharacterBody2D
@onready var barra_vida = $BarraVida
@onready var pantalla_perdiste = $Perdiste

var bloques_restantes := 0
var juego_iniciado := false

func _ready() -> void:
	add_to_group("juego") 
	pantalla_perdiste.hide()
	pelota.vida_cambiada.connect(_on_vida_cambiada)
	contar_bloques()

func contar_bloques() -> void:
	var intentos := 0
	while get_tree().get_nodes_in_group("bloques").size() == 0 and intentos < 10:
		await get_tree().process_frame
		intentos += 1

	bloques_restantes = get_tree().get_nodes_in_group("bloques").size()
	print("Bloques contados: ", bloques_restantes)
	juego_iniciado = true

func bloque_destruido() -> void:
	if not juego_iniciado:
		return
	bloques_restantes -= 1

	if bloques_restantes <= 0:
		pelota.activarse = false
		await get_tree().create_timer(0.8).timeout
		get_tree().change_scene_to_file("res://escenas/ganaste.tscn")

func _on_vida_cambiada(nueva_vida: int) -> void:
	var corazones = barra_vida.get_children()
	if nueva_vida >= 0 and nueva_vida < corazones.size():
		corazones[nueva_vida].hide()

	if nueva_vida <= 0:
		pelota.activarse = false
		get_tree().change_scene_to_file("res://escenas/perdiste.tscn")
