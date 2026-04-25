extends Area2D
var entrou = false

func _process(delta: float) -> void:
	if entrou == true and Input.is_action_just_pressed("interagir-plantar") and Dados.agua<5:
		Dados.agua = int(5)

func _on_body_entered(body: Node2D) -> void:
	entrou = true

func _on_body_exited(body: Node2D) -> void:
	entrou = false
