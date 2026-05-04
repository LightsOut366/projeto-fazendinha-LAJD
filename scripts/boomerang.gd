class_name bumerangue extends Node2D

enum State { INACTIVE, THROW, RETURN }

var jogador : Node2D # Referência para o retorno
var direcao = Vector2.ZERO
var speed : float = 0.0
var state = State.INACTIVE

@export var acceleration: float = 800.0 
@export var max_speed: float = 500.0
@onready var animationa_player: AnimationPlayer = $AnimationPlayer

func _process(delta: float) -> void:
	match state:
		State.THROW:
			# Reduz a velocidade até parar
			speed = move_toward(speed, 0, acceleration * delta)
			global_position += direcao * speed * delta
			
			if speed <= 0:
				state = State.RETURN
				
		State.RETURN:
			if jogador:
				# Move em direção ao jogador
				var para_jogador = (jogador.global_position - global_position).normalized()
				speed = move_toward(speed, max_speed, acceleration * delta)
				global_position += para_jogador * speed * delta
				
				
				if global_position.distance_to(jogador.global_position) < 10:
					queue_free()

func shoot(throw_direction: Vector2, pos_inicial: Vector2, ref_jogador: Node2D) -> void:
	self.global_position = pos_inicial
	self.jogador = ref_jogador
	self.direcao = throw_direction.normalized()
	self.speed = max_speed
	self.state = State.THROW
	
	if animationa_player:
		animationa_player.play("bumerangue")
