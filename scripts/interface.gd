extends CanvasLayer

@onready var dinheiro: Label = $Control/dinheiro
@onready var colhido: Label = $Control/colhido
@onready var agua: Label = $Control/agua
@onready var textos: Label = $Control/textos
@onready var tempo: Label = $Control/tempo
@onready var sementes: Label = $Control/sementes


func _ready() -> void:
	$Timer.wait_time = 1.0
	$Timer.start()


func _process(delta: float) -> void:
	
	
	if Dados.tempo>=0:
		tempo.text = str(Dados.tempo)
		dinheiro.text = str(Dados.dinheiro)
		sementes.text = str(Dados.semente)
		colhido.text = str(Dados.colhido)
		agua.text = str(Dados.agua)
	
	else:
		tempo.text = "vida: "+ str(Dados.vida)
		dinheiro.hide()
		sementes.hide()
		colhido.hide()
		agua.hide()
		textos.hide()
	

func _on_timer_timeout() -> void:
	if Dados.tempo >=-1:
		Dados.tempo -= 1
