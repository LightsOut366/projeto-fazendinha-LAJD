extends Area2D
var entrou = false

@onready var objeto_antigo = $"."

func _process(delta: float) -> void:
	if entrou == true and Input.is_action_just_pressed("interagir") and Dados.agua<5:
		Dados.agua = int(5)
		$Audioagua.play()
		
	if Dados.tempo <0:
		objeto_antigo.queue_free()


func _on_body_entered(body: Node2D) -> void:
	entrou = true

func _on_body_exited(body: Node2D) -> void:
	entrou = false
