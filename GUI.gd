extends CanvasLayer


func _ready():
	$Label.text= "0"

func ponPuntuacion(valor):
	$Label.text=("puntos: "+str(valor))
