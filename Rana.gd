extends CharacterBody2D

var speed: int = 500
var recolectadas: int = 0

func _physics_process(delta):
	
	var MovDI= Input.get_axis("ui_left","ui_right")
	var Movimiento=Vector2(MovDI,0)
	
	if Input.is_action_pressed("ui_right"):
		$AnimatedSprite2D.flip_h = false
		$AnimatedSprite2D.play("run")
	elif Input.is_action_pressed("ui_left"):
		$AnimatedSprite2D.flip_h=true
		$AnimatedSprite2D.play("run")
	else:
		Movimiento = Vector2.ZERO
		$AnimatedSprite2D.play("Idle")
	velocity= Movimiento.normalized()* speed
	
	move_and_slide()
		
func _on_area_2d_body_entered(body):
	if body.is_in_group("bananas"):
		recolectadas += 1
		print("frutas recolectadas " + str(recolectadas))
		body.queue_free()
		
