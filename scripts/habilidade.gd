class_name Habilidade_player extends Node

const BOOMERANG = preload("res://cenas/bumerangue.tscn")

enum habilidade {BOOMERANG, GRAPPLE}
var direcao = Vector2.ZERO
var selected_ability = habilidade.BOOMERANG
var cardinal_direction = Vector2.DOWN
var jogador
var boomerang_instance : bumerangue = null
var throw_direction = Vector2.ZERO

func _ready() -> void:
	pass


func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("habilidade"):
		if selected_ability == habilidade.BOOMERANG:
			if boomerang_instance == null:
				boomerang_ability()
	pass
	
	
func boomerang_ability() -> void:
	if boomerang_instance != null:
		return
	
	jogador = get_tree().get_first_node_in_group("jogador")
	
	if not jogador:
		print("Erro: Jogador não encontrado no grupo 'jogador'")
		return
		
	var _b = BOOMERANG.instantiate() as bumerangue
	
	get_tree().get_current_scene().add_child(_b)
	
	var _dir = jogador.direcao
	if _dir == Vector2.ZERO:
		_dir = Vector2.DOWN
		
	
	_b.shoot(_dir, jogador.global_position, jogador)
	
	throw_direction = _dir
	boomerang_instance = _b
