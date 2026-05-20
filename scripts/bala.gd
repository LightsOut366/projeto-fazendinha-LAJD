extends Area2D

@export var bala_velocidade = 1000.0
var direcao : Vector2= Vector2.ZERO
var atingiu = false #para que atinja apenas um inimigo por vez

func _physics_process(delta: float) -> void:
	position += direcao.rotated(rotation) * bala_velocidade * delta

func adicionar_direcao(nova_direcao):
	direcao = nova_direcao.normalized()

func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("inimigos") and atingiu== false:
		atingiu=true
		body.dano(1, global_position)
		await get_tree().create_timer(0.03).timeout
		queue_free()
