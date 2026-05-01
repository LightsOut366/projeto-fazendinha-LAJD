extends Area2D

@export var bala_velocidade = 1000.0
var direcao : Vector2= Vector2.ZERO

func _physics_process(delta: float) -> void:
	position += direcao.rotated(rotation) * bala_velocidade * delta

func adicionar_direcao(nova_direcao):
	direcao = nova_direcao.normalized()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
