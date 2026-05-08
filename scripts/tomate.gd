extends Area2D

var entrou = false
var precisa_regar = false
var maduro = false
var ja_tem_planta = false
@onready var objeto_antigo = $"."


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Dados.tempo >-1:
		$planta_seca_label.text = str(Dados.semente_secando)
		
		#plantar
		if Dados.semente >=1 and Input.is_action_just_pressed("interagir") and entrou== true and ja_tem_planta == false:
			Dados.semente_secando=5
			$planta_seca_label.hide()
			$planta_seca.hide()
			
			#plantar
			Dados.semente -=1
			show() 
			ja_tem_planta = true
			$Audioplantar.play()
			$animacao_tomate.frame=0
			await get_tree().create_timer(3.0).timeout
			$animacao_tomate.frame=1
			await get_tree().create_timer(4.0).timeout
			$animacao_tomate.frame=2
			await get_tree().create_timer(5.0).timeout
			precisa_regar = true
			$planta_seca.show()
			$Audioprecisaaguar.play()
			await get_tree().create_timer(2.0).timeout
			if precisa_regar == true:
				$planta_seca_label.show()
			await get_tree().create_timer(1.0).timeout
			Dados.semente_secando=4
			await get_tree().create_timer(1.0).timeout
			Dados.semente_secando=3
			await get_tree().create_timer(1.0).timeout
			Dados.semente_secando=2
			await get_tree().create_timer(1.0).timeout
			Dados.semente_secando=1
			await get_tree().create_timer(1.0).timeout
			Dados.semente_secando=0
			await get_tree().create_timer(1.0).timeout
			if precisa_regar == true:
				$Audiomorreu.play()
				hide()
				$planta_seca.hide()
				
				$planta_seca_label.hide()
				precisa_regar = false
				ja_tem_planta = false
		
		#regar
		if precisa_regar == true and entrou == true and Input.is_action_just_pressed("interagir") and Dados.agua >= 1:
			precisa_regar = false
			$Audioregou.play()
			Dados.agua -= 1
			$planta_seca.hide()
			$planta_seca_label.hide()
			await get_tree().create_timer(6.0).timeout
			$animacao_tomate.frame=3
			await get_tree().create_timer(6.0).timeout
			$animacao_tomate.frame=4
			await get_tree().create_timer(7.0).timeout
			$animacao_tomate.frame=5
			maduro=true
			
			
		#colher
		if maduro==true and entrou==true and Input.is_action_just_pressed("interagir"):
			$Audiocolher.play()
			hide()
			ja_tem_planta= false
			Dados.colhido+=1
			maduro=false
		
		
	if Dados.tempo <=-1 and Dados.dinheiro <200 and ja_tem_planta== true:
		while $animacao_tomate.frame>0:
			await get_tree().create_timer(1.0).timeout
			$animacao_tomate.frame-=1
			
			
	if Dados.tempo<=-1 and ja_tem_planta== true and $animacao_tomate.frame==0 and Dados.dinheiro<200:
		var tomate_noite = preload("res://cenas/tomate_noite.tscn").instantiate() #inicia o sprite
		tomate_noite.global_position = objeto_antigo.global_position # Coloca o novo na mesma posição
		
		$"../..".add_child.call_deferred(tomate_noite) #adiciona um novo nó no lugar
		objeto_antigo.queue_free() # Remove o antigo da memória

		
func _on_body_entered(body: Node2D) -> void:
	entrou = true
	


func _on_body_exited(body: Node2D) -> void:
	entrou = false
