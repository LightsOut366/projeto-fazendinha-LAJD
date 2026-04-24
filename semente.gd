extends Area2D
var entrou


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interagir-plantar") and Dados.dinheiro>=1 and entrou==true:
		Dados.dinheiro-=1
		Dados.semente +=1


func _on_body_entered(body: Node2D) -> void:
	entrou = true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
