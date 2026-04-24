extends CharacterBody2D

@export var SPEED = 200.0
var tam_tela


func _ready():
	tam_tela = get_viewport_rect().size

func _physics_process(delta) -> void:
	
	
	var direction = Vector2.ZERO # vetor de movimento do player
	
	if Input.is_action_pressed("Direita"):
		direction.x += 1
		$AnimatedSprite2D.play("andando_frente")
	if Input.is_action_pressed("Esquerda"):
		direction.x -= 1
		$AnimatedSprite2D.play("andando_tras")
	if Input.is_action_pressed("Down"):
		direction.y += 1
	if Input.is_action_pressed("UP"):
		direction.y -= 1
	
	
	if direction.length() == 0:
		$AnimatedSprite2D.play("parado") # sem apertar botao, fica parado
	
	if direction.length() > 0:
		direction = direction.normalized() * SPEED
	
	position += direction * delta # move o personagem sem atrelar ao fps
	position = position.clamp(Vector2.ZERO, tam_tela) # nao deixa ele sair da tela
