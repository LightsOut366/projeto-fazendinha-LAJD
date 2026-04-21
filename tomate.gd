extends Area2D
var entrou = false
var maduro=false

var ja_tem_planta = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	hide()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Dados.semente >=1 and Input.is_action_just_pressed("ui_accept") and entrou== true and ja_tem_planta == false:
		Dados.semente -=1
		show() 
		ja_tem_planta = true
		$animacao_tomate.frame=0
		await get_tree().create_timer(3.0).timeout
		$animacao_tomate.frame=1
		await get_tree().create_timer(5.0).timeout
		$animacao_tomate.frame=2
		await get_tree().create_timer(7.0).timeout
		$animacao_tomate.frame=3
		await get_tree().create_timer(10.0).timeout
		$animacao_tomate.frame=4
		await get_tree().create_timer(10.0).timeout
		$animacao_tomate.frame=5
		maduro=true
	if maduro==true and entrou==true and Input.is_action_just_pressed("ui_accept"):
		hide()
		ja_tem_planta= false
		Dados.colhido+=1
		maduro=false
		
func _on_body_entered(body: Node2D) -> void:
	entrou = true


func _on_body_exited(body: Node2D) -> void:
	entrou = false
