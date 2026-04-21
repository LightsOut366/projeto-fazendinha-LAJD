extends Area2D
var entrou

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

	if Input.is_action_just_pressed("ui_accept") and Dados.dinheiro>=1 and entrou==true:
		Dados.dinheiro-=1
		Dados.semente +=1


func _on_body_entered(body: Node2D) -> void:
	entrou = true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
