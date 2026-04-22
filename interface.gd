extends CanvasLayer

func _process(delta: float) -> void:
	$dinheiro.text = str(Dados.dinheiro)
	$sementes.text = str(Dados.semente)
	$colhido.text = str(Dados.colhido)
