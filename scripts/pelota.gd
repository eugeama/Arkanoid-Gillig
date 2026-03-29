extends CharacterBody2D

signal vida_cambiada(nueva_vida)

var rapidez = 350
var direccion = Vector2.DOWN
var activarse = true
var vida: int = 3
var vidaTotal: int = 3

func _ready() -> void:
	velocity = Vector2(rapidez * -1, rapidez)

func _physics_process(delta: float) -> void:
	if activarse:
		var colisionar = move_and_collide(velocity * delta)
		if colisionar:
			velocity = velocity.bounce(colisionar.get_normal())
			if colisionar.get_collider().has_method("pegar"):
				colisionar.get_collider().pegar()
		if velocity.y > 0 and velocity.y < 100:
			velocity.y = -200
		if velocity.x == 0:
			velocity.x = -200

func respawn(pos: Vector2) -> void:
	global_position = pos
	velocity = Vector2(rapidez * -1, rapidez)
	vida -= 1
	emit_signal("vida_cambiada", vida)
