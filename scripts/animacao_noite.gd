extends AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	autoplay= "dia"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if Dados.tempo==-1 and current_animation != "noite":
		play("noite")
		$Chegarnoite.play()
	
