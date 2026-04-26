extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$animacao_tomate_noite.hide()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
			
		#iniciar a noite
	if Dados.tempo<=0 and Dados.dinheiro<10:
		$animacao_noite.play()
		while $animacao_tomate.frame !=0 and Dados.ja_tem_planta==true:
			await get_tree().create_timer(1.0).timeout
			$animacao_tomate.frame -=1
		$animacao_tomate.hide()
		$animacao_tomate_noite.show()
