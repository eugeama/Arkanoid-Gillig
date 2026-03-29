extends RigidBody2D

func _ready() -> void:
	freeze = true
	add_to_group("bloques")

func pegar():
	$Sprite2D.visible = false
	$CollisionShape2D.disabled = true
	
	get_tree().call_group("juego", "bloque_destruido")
	
	await get_tree().create_timer(1).timeout
	queue_free()
