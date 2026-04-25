extends Area2D
var entrou


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interagir") and Dados.dinheiro>=2 and entrou==true:
		Dados.dinheiro-=2
		Dados.semente +=1


func _on_body_entered(body: Node2D) -> void:
	entrou = true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
