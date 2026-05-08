extends CharacterBody2D

@onready var animacao_tomate_noite: AnimatedSprite2D = $animacao_tomate_noite

@export var velocidade : float = 20.0
@export var vida : int = 3
@export var cena_bala = preload("res://cenas/bala_inimigo.tscn")

var empurrar_velocidade: Vector2 = Vector2.ZERO
var empurrar_diminuir: float = 1000.0

var direcao : Vector2 = Vector2.ZERO
var jogador = null

var pode_atirar= true

func _ready() -> void:
	jogador = Dados.jogador
	
func animacao():
	$animacao_tomate_noite.play("machucado")
	await get_tree().create_timer(0.5).timeout
	$animacao_tomate_noite.play("padrao")
	$animacao_tomate_noite.frame = 5

func _physics_process(delta: float) -> void:
	show()
	if empurrar_velocidade.length()>1: #empurra pra trás
		animacao()
		velocity = empurrar_velocidade
		move_and_slide()
		empurrar_velocidade = empurrar_velocidade.move_toward(Vector2.ZERO, empurrar_diminuir * delta)
	
	elif jogador and $animacao_tomate_noite.frame==5: #segue o jogador
		await get_tree().create_timer(2.0).timeout
		
		if get_tree().has_group("fazendeira"):
			direcao = global_position.direction_to(jogador.global_position)
			velocity = velocidade * direcao
			if pode_atirar:
				atirar(jogador.global_position - global_position)
		
	move_and_slide()
	

func empurrar(forca: Vector2):
	empurrar_velocidade = forca
	
	
func dano(quantia: int, posicao:Vector2):
	var empurrar_direcao = (global_position - posicao).normalized()
	empurrar(empurrar_direcao*200)
	vida -= quantia
	$Audiodano.play()
	if vida <=0:
		$Audiomorre.play()
		queue_free()
		
func atirar(direcao):
	pode_atirar = false
	$Audioatirar.play()
	var instanciar_bala = cena_bala.instantiate()
	get_tree().current_scene.add_child(instanciar_bala)
	instanciar_bala.global_position = global_position
	instanciar_bala.adicionar_direcao(direcao)
	
	await get_tree().create_timer(1.0).timeout
	pode_atirar = true
		
