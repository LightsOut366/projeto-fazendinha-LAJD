extends CharacterBody2D

@export var jogador_velocidade = 200.0
@export var cena_bala = preload("res://cenas/bala.tscn")
var tamanho_tela
var pode_atirar : bool = true
var direcao = Vector2.DOWN

func _ready():
	tamanho_tela = get_viewport_rect().size
	

func _physics_process(delta) -> void:
	
	
	var direcao_mouse = get_global_mouse_position()- global_position
	var direcao = Vector2.ZERO # vetor de movimento do player
	var posicao_mouse = get_global_mouse_position()
	if Input.is_action_pressed("Direita"):
		direcao.x += 1
		
	if Input.is_action_pressed("Esquerda"):
		direcao.x -= 1
		
	if Input.is_action_pressed("Baixo"):
		direcao.y += 1
		# $AnimatedSprite2d.play()
	if Input.is_action_pressed("Cima"):
		direcao.y -= 1
		# $AnimatedSprite2d.play()
		
	if posicao_mouse.x > global_position.x: #faz com que a personagem vire pra direção do mouse
		$AnimatedSprite2D.play("andando_frente")
	if posicao_mouse.x < global_position.x:
		$AnimatedSprite2D.play("andando_tras")
	#if posicao_mouse.y > global_position.y: #faz com que a personagem vire pra direção do mouse
	#	$AnimatedSprite2D.play("andando_cima")
	#if posicao_mouse.y < global_position.y:
	#	$AnimatedSprite2D.play("andando_baixo")
	
	if direcao.length() == 0:
		$AnimatedSprite2D.play("parado") # sem apertar botao, fica parado
	
	if direcao.length() > 0:
		direcao = direcao.normalized() * jogador_velocidade
	
	position += direcao * delta # move o personagem sem atrelar ao fps
	position = position.clamp(Vector2.ZERO, tamanho_tela) # nao deixa ele sair da tela
	
	
	if Input.is_action_pressed("interagir"):
		pass
		# botar aqui as animaçoes dela regando
		
	if Input.is_action_pressed("interagir") and pode_atirar:
		atirar(direcao_mouse)
		
	
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
	
func atirar(direcao):
	pode_atirar = false
	
	var instanciar_bala = cena_bala.instantiate()
	get_tree().current_scene.add_child(instanciar_bala)
	instanciar_bala.global_position = global_position
	instanciar_bala.adicionar_direcao(direcao)
	$Audiobala.play()
	
	await get_tree().create_timer(0.5).timeout
	pode_atirar= true
	
func dano(quantia):
	Dados.vida -= quantia
	$Audiodano.play()
	if Dados.vida <=0:
		queue_free()
