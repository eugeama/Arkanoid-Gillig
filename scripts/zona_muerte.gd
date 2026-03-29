extends Area2D

@export var pelota: CharacterBody2D
@export var spawn: Vector2 = Vector2(400, 350)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:
		body.respawn(spawn)
