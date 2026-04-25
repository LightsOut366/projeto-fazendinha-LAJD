extends CanvasLayer
func _ready() -> void:
	$Timer.wait_time = 1.0
	$Timer.start()

func _process(delta: float) -> void:
	
	$dinheiro.text = str(Dados.dinheiro)
	$sementes.text = str(Dados.semente)
	$colhido.text = str(Dados.colhido)
	$agua.text = str(Dados.agua)
	$tempo.text = str(Dados.tempo)

func _on_timer_timeout() -> void:
	Dados.tempo -= 1
