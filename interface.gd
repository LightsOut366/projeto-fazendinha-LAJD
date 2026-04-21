extends CanvasLayer



func modificar_dinheiro(Dados):
	$dinheiro.text = str(Dados.dinheiro)

func modificar_sementes(Dados):
	$sementes.text = str(Dados.sementes)

func modificar_colhidos(Dados):
	$colhido.text = str(Dados.colhido)
