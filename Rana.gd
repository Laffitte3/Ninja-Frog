extends CharacterBody2D

var speed: int = 300
var jump_velocity: int = 400
var gravity: int = 980

#frutas recolectadas
var recolectadas: int = 0
@onready var animacion = $AnimatedSprite2D
@onready var GUI = preload("res://GUI.tscn")


func _physics_process(delta):
	
	#Animacion
	if velocity.x < 0:
		animacion.flip_h=true
		animacion.play("run")
	elif velocity.x >0:
		animacion.flip_h=false
		animacion.play("run")
	else:
		animacion.play("idle")
		
	#Anadimos la gravedad
	if not is_on_floor():
		velocity.y += gravity* delta
		
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y -= jump_velocity

	var Direccion=Input.get_axis("ui_left","ui_right")
	if Direccion != 0 :
		velocity.x = Direccion * speed 
	else: 
		velocity.x = 0
	move_and_slide()
		
func _on_area_2d_body_entered(body):
	
	if body.is_in_group("bananas"):
		recolectadas += 1
		#La referencia a este nodo se puede mejorar
		$"../GUI".ponPuntuacion(recolectadas)
		$Efectorecoleccion.play()
		print("frutas recolectadas " + str(recolectadas))
		body.queue_free()
		
