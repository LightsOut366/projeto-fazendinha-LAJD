extends Area2D

var entrou = false
var precisa_regar = false
var maduro = false
var ja_tem_planta = false
var ja_regou = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Dados.semente >=1 and Input.is_action_just_pressed("interagir-plantar") and entrou== true and ja_tem_planta == false:
		Dados.semente -=1
		show() 
		ja_tem_planta = true
		$animacao_tomate.frame=0
		await get_tree().create_timer(3.0).timeout
		$animacao_tomate.frame=1
		await get_tree().create_timer(5.0).timeout
		$animacao_tomate.frame=2
		precisa_regar = true
		$planta_seca.show()
		await get_tree().create_timer(10.0).timeout
		if precisa_regar == true:
			hide()
			$planta_seca.hide()
			precisa_regar = false
			ja_tem_planta = false
	
	
	if precisa_regar == true and entrou == true and Input.is_action_just_pressed("regar") and Dados.agua >= 1 and ja_regou == false:
		ja_regou = true
		precisa_regar = false
		Dados.agua -= 1
		$planta_seca.hide()
		
		await get_tree().create_timer(7.0).timeout
		$animacao_tomate.frame=3
		await get_tree().create_timer(10.0).timeout
		$animacao_tomate.frame=4
		await get_tree().create_timer(10.0).timeout
		$animacao_tomate.frame=5
		maduro=true
	
	
	if maduro==true and entrou==true and Input.is_action_just_pressed("interagir-plantar"):
		hide()
		ja_tem_planta= false
		Dados.colhido+=1
		maduro=false
		
func _on_body_entered(body: Node2D) -> void:
	entrou = true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
