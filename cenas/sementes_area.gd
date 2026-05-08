extends Area2D
var entrou = false
@onready var objeto_antigo = $"."

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interagir") and Dados.dinheiro>=2 and entrou==true:
		Dados.dinheiro-=2
		Dados.semente +=1
		$Audiosemente.play()
		
	if Dados.tempo <0:
		objeto_antigo.queue_free()


func _on_body_entered(body: Node2D) -> void:
	entrou = true
	print("sto dentro semem")


func _on_body_exited(body: Node2D) -> void:
	entrou = false
