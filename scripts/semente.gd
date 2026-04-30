extends Area2D
var entrou = false


func _process(delta: float) -> void:
	if entrou == true and Input.is_action_just_pressed("interagir") and Dados.dinheiro>=1:
		Dados.semente+=1
		Dados.dinheiro-=1
	


func _on_semente_entered(body: Node2D) -> void:
	entrou = true


func _on_semente_exited(body: Node2D) -> void:
	entrou = false
