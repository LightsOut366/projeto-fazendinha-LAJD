extends CharacterBody2D

const SPEED = 100.0
const JUMP_VELOCITY = -100.0

func _physics_process(delta) -> void:
	
	#movimentar para os 4 lados
	var direction = Input.get_vector("Esquerda", "Direita", "UP","Down")
	
	if Input.is_action_pressed("Direita") || Input.is_action_pressed("Esquerda") || Input.is_action_pressed("UP") || Input.is_action_pressed("Down"):
		pass
	else:
		direction = Vector2.ZERO
		$AnimatedSprite2D.play("parado") # sem apertar botao, fica parado
	direction = direction.normalized()
	
	velocity = (direction * SPEED)
	move_and_slide()
	
	
	# Andar para frente e para trás
	if Input.is_action_just_pressed("ui_left"):
		$AnimatedSprite2D.play("andando_tras")
		
	if Input.is_action_just_pressed("ui_right"):
		$AnimatedSprite2D.play("andando_frente")
		
		
