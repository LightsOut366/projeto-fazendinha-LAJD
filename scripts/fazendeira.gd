extends CharacterBody2D

@export var jogador_velocidade = 200.0
var tamanho_tela
		
# Carrega o novo script
var novo_script = load("res://scripts/atirar_fazendeira.gd")
var direcao = Vector2.ZERO
var direcao_olhar = Vector2.DOWN

func _ready():
	
	tamanho_tela = get_viewport_rect().size
	Dados.jogador = self
	

func _physics_process(delta) -> void:
	
	var _direcao_mouse = get_global_mouse_position()- global_position
	direcao = Vector2.ZERO # vetor de movimento do player
	var _posicao_mouse = get_global_mouse_position()
	
	
	
	if Input.is_action_pressed("Direita"):
		direcao.x += 1
		$AnimatedSprite2D.play("andando_frente")
	if Input.is_action_pressed("Esquerda"):
		direcao.x -= 1
		$AnimatedSprite2D.play("andando_tras")
	if Input.is_action_pressed("Baixo"):
		direcao.y += 1
		$AnimatedSprite2D.play("andando_baixo")
	if Input.is_action_pressed("Cima"):
		direcao.y -= 1
		$AnimatedSprite2D.play("andando_cima")
	
	if direcao.length() == 0:
		$AnimatedSprite2D.play("parado") # sem apertar botao, fica parado
	
	if direcao.length() > 0:
		direcao = direcao.normalized() * jogador_velocidade
	if direcao != Vector2.ZERO:
		direcao_olhar = direcao
	
	move_and_collide(direcao * delta) # o personagem anda e checa se bateu em algo
	position = position.clamp(Vector2.ZERO, tamanho_tela) # nao deixa ele sair da tela
	
	
	if Input.is_action_pressed("interagir"):
		pass
		# botar aqui as animaçoes dela regando
		
	if Dados.tempo<=-1 and Dados.dinheiro<200:
		atirar_fazendeira()

func atirar_fazendeira():
	self.set_script(novo_script)
	
	# Chama _ready() novamente para iniciar o novo comportamento
	self._ready() 
