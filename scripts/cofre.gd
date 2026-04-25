extends Area2D
var entrou = false


func _process(delta: float) -> void:
	if entrou == true and Input.is_action_just_pressed("interagir") and Dados.colhido>=1:
		Dados.colhido-=1
		Dados.dinheiro+=3
	


func _on_body_entered(body: Node2D) -> void:
	entrou= true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
